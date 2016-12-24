class Page < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :by_id, -> (orderer = :desc) { order(id: orderer) }
  scope :by_title, -> (orderer = :asc) { order(title: orderer) }
  scope :by_slug, -> (orderer = :asc) { order(slug: orderer) }
  scope :by_created_at, -> (orderer = :desc) { order(created_at: orderer) }
  scope :search, -> (query) {
    where(self.column_names.reject{ |x|
      %w(id created_at updated_at).include? x
    }.collect{ |x|
      x + ' LIKE :query'
    }.join(' OR '), query: "%#{query}%")
  }

  private

    def should_generate_new_friendly_id?
      slug.blank?
    end
end
