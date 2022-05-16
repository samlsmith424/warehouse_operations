require "rails_helper"

RSpec.describe "Update Item" do
  it 'can update an existing item' do
    item = Item.create(name: "Water fountain", description: "Emits water", price: 101010.00)

    visit edit_item_path(item)

    fill_in "Name", with: "Pencil Sharpener"
    fill_in "Description", with: "Sharpens pencils"
    fill_in "Price", with: 15.00

    click_on("Update")

    expect(current_path).to eq(item_path(item))
    expect(page).to have_content("Pencil Sharpener")
    # expect(page).to have_content("Update was successfull.")
    # expect(page).to_not have_content("Water fountain")
  end

  xit 'receives feedback if update was unsuccessful' do
    item = Item.create(name: "Water fountain", description: "Emits water", price: 101010.00)

    visit edit_item_path(item)

    fill_in "Name", with: ""
    fill_in "Description", with: "Sharpens pencils"
    fill_in "Price", with: 15.00

    click_on("Update")

    expect(current_path).to eq(edit_item_path(item))
    expect(page).to have_content("Unable to update item, please try again")
  end
end
