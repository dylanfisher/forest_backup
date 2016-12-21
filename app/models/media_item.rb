class MediaItem < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_attached_file :attachment, styles: { large: '1200x1200>', medium: '600x600>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  scope :by_id, -> (orderer = :desc) { order(id: orderer) }
  scope :by_date, -> (date) {
    begin
      date = Date.parse(date)
      where('created_at >= ? AND created_at <= ?', date.beginning_of_month, date.end_of_month)
    rescue ArgumentError => e
      date = nil
    end
  }

  def self.dates_for_filter
    self.grouped_by_year_month.collect { |x| [x.created_at.strftime('%B %Y'), x.created_at.strftime('%d-%m-%Y')] }
  end

  private

    def self.grouped_by_year_month
      self.group("strftime('%Y%m', created_at)").distinct
    end

    def slug_candidates
      [
        :title,
        :id,
        [:id, :attachment_file_name]
      ]
    end

    def should_generate_new_friendly_id?
      slug.blank?
    end
end