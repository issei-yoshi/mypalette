class Tag < ApplicationRecord
  has_many :palette_tags, dependent: :destroy
  has_many :palettes, through: :palette_tags
end
