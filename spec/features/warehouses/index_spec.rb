require "rails_helper"

RSpec.describe "Warehouses Index Page" do
  it 'has a list of warehouses' do
    visit warehouses_path

    expect(page).to have_content("Warehouses")
  end

  it 'has a button to create a warehouse' do
    visit warehouses_path
    expect(page).to have_button("Create Warehouse")

    click_button("Create Warehouse")

    expect(current_path).to eq(new_warehouse_path)
  end

  xit 'has a link to assign inventory to the location' do
    item = Item.create(name: "Water fountain", description: "Emits water", price: 101010.00)

    visit warehouses_path

    click_button("Assign To Inventory")

    # expect(current_path).to eq(warehouses_path)

    expect(page).to have_content("Assign To Inventory")

  end
end
