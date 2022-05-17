require 'rails_helper'

RSpec.describe 'Warehoue Show Page' do
  it 'can display the warehouse attributes' do
    warehouse = FactoryBot.create(:warehouse)

    visit warehouse_path(warehouse)

    expect(page).to have_content("#{warehouse.name} Warehouse Information")

    expect(page).to have_content(warehouse.location)
    expect(warehouse.location).to be_a(String)
    expect(page).to have_content("Add inventory items to this warehouse:")
  end

  it 'has a button to add inventory items to the warehouse' do
    warehouse = FactoryBot.create(:warehouse)
    item = FactoryBot.create(:item)

    visit warehouse_path(warehouse)

    within("#selected") do
      expect(page).to_not have_content(item.name)
    end

    select "#{item.name}", :from => "items"
    click_on "Add Item"

    within("#selected") do
      expect(page).to have_content(item.name)
    end
  end
end
