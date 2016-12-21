class MediaItem < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_attached_file :attachment, styles: { large: '1200x1200>', medium: '600x600>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  # Admin filter scopes
  scope :by_id, -> (orderer = :desc) { order(id: orderer) }

  private

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
