class LikeSecond < ApplicationRecord
  belongs_to :user
  belongs_to :palette_second

  validates :user_id, uniqueness: { scope: :palette_second_id }
end
