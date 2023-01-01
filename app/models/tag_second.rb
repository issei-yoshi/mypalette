class TagSecond < ApplicationRecord
  has_many :palette_second_tags, dependent: :destroy
  has_many :palette_seconds, through: :palette_second_tags

  validates :name, presence: true, uniqueness: true
end
