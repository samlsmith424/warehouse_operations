require "rails_helper"

RSpec.describe "Edit Item" do
  it 'can edit an existing item' do
    item = FactoryBot.create(:item)

    visit item_path(item)

    expect(page).to have_button("Edit Item")

    click_on("Edit Item")

    expect(current_path).to eq(edit_item_path(item))
  end
end
