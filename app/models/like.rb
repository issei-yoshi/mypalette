class Like < ApplicationRecord
  belongs_to :user
  belongs_to :palette

  validates :user_id, uniqueness: { scope: :palette_id }
end
