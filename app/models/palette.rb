class Palette < ApplicationRecord

  belongs_to :user
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :main
    validates :sub
    validates :body
  end
end
