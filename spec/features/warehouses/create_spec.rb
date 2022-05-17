require "rails_helper"

RSpec.describe "Create Warehouse" do
  it 'can create a new warehouse after filling in a form' do
    visit new_warehouse_path

    fill_in "Name", with: "Exceptionally Large Warehouse"
    fill_in "Location", with: "San Francisco, CA"
    click_on("Submit")

    expect(current_path).to eq(warehouses_path)
    expect(page).to have_content("Exceptionally Large Warehouse")
  end
end
