class Warehouse < ApplicationRecord
  has_many :item_warehouses
  has_many :items, through: :item_warehouses
end
