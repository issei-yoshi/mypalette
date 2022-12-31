class PaletteSecond < ApplicationRecord
  belongs_to :user
  has_many :like_seconds, dependent: :destroy
end
