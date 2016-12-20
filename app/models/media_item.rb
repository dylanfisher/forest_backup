class MediaItem < ApplicationRecord
  has_attached_file :attachment, styles: { large: '1200x1200>', medium: '600x600>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
end
