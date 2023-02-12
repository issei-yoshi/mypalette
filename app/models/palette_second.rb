class PaletteSecond < ApplicationRecord
  belongs_to :user
  has_many :like_seconds, dependent: :destroy
  has_many :palette_second_tags, dependent: :destroy
  has_many :tag_seconds, through: :palette_second_tags

  validates :main, presence: true
  validates :sub, presence: true
  validates :body, presence: true
  validates :bg, presence: true

  scope :with_tag, ->(tag_second_name) { joins(:tag_seconds).where(tag_seconds: { name: tag_second_name }) }
end
