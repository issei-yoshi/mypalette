class Palette < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :main
    validates :sub
    validates :body
  end
end
