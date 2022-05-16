require "rails_helper"

RSpec.describe "Delete Item" do
  it 'can delete an existing item' do
    item = Item.create(name: "Water fountain", description: "Emits water", price: 101010.00)

    visit item_path(item)

    expect(page).to have_button("Delete Item")
    expect(page).to have_content("Water fountain")

    click_on("Delete Item")

    expect(current_path).to eq(items_path)
    expect(page).to_not have_content("Water fountain")
    expect(page).to have_content("Item successfully deleted.")
  end
end
