class Ressource < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_rich_text :content
end
