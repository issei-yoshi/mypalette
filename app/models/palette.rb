class Palette < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :palette_tags, dependent: :destroy
  has_many :tags, through: :palette_tags

  with_options presence: true do
    validates :main
    validates :sub
    validates :body
  end

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }

  enum bgimage: { Red: 0, Blue: 1, Green: 2, Yellow: 3, Purple: 4, Orange: 5, Black: 6, Grey: 7, White: 8 }
end
