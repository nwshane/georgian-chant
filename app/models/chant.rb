class Chant < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
