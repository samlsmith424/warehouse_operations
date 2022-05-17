require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'relationships' do
    it { should have_many(:item_warehouses) }
    it { should have_many(:items).through(:item_warehouses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end
end
