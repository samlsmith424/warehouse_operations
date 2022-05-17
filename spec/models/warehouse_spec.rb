require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'relationships' do
    it { should have_many(:item_warehouses) }
    it { should have_many(:items).through(:item_warehouses) }
  end
end
