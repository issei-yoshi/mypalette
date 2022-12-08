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
end
