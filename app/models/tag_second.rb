class TagSecond < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
