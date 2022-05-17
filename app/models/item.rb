class Item < ApplicationRecord
  has_many :item_warehouses
  has_many :warehouses, through: :item_warehouses
  validates_presence_of :name, :description, :price
  validates_numericality_of :price
end
