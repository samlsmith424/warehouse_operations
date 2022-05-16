class Item < ApplicationRecord
  belongs_to :warehouse
  validates_presence_of :name, :description, :price
  validates_numericality_of :price
end
