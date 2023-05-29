class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_rich_text :content
  validates :title, presence: true
  validates :filter, presence: true

  FILTERS = ["Ethnographie urbaine", "Discriminations", "Écologie"]
end
