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

  enum bgimage: { Black: 0, Grey: 1, White: 2, Red: 3, Blue: 4, Green: 5, Yellow: 6, Purple: 7, Orange: 8 }
end
