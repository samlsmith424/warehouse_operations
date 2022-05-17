class Warehouse < ApplicationRecord
  has_many :item_warehouses
  has_many :items, through: :item_warehouses

  validates_presence_of :name
  validates_presence_of :location

  def add_item(item)
    items << item
  end
end
