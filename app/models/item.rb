class Item < ApplicationRecord
  validates_presence_of :name, :description, :price
  validates_numericality_of :price
end
