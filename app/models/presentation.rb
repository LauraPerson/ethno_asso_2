class Presentation < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  has_rich_text :content

end
