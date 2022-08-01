class Snack < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { in: 30..180 }
  validates :ingredients, presence: true, length: { in: 3..180 }
  validates :price, numericality: { greater_than: 0.00 }
end
