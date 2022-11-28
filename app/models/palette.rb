class Palette < ApplicationRecord
  with_options presence: true do
    validates :main
    validates :sub
    validates :body
  end
end
