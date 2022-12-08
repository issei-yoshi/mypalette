class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :palettes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_palettes, through: :likes, source: :palette

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }

  enum role: {
    general: 0,
    admin: 1
  }

  def own?(object)
    id == object.user_id
  end

  def like(palette)
    likes_palettes << palette
  end

  def unlike(palette)
    likes_palettes.destroy(palette)
  end

  def like?(palette)
    palette.likes.pluck(:user_id).include?(id)
  end
end
