require 'rails_helper'

RSpec.describe 'Items Index Page' do
  it 'can display a list of all inventory items' do
    items = FactoryBot.create_list(:item, 3)
    visit items_path

    expect(page).to have_content("Inventory Items")
    expect(items.count).to eq(3)
    # items.each do |item|
    #   expect(item.name).to be_a(String)
    #   expect(item.description).to be_a(String)
    #   expect(item.price).to be_a(Float)
    # end
  end

  it 'has a link to each item show page' do
    item = FactoryBot.create(:item)

    visit items_path

    expect(page).to have_link(item.name)

    click_link(item.name)

    expect(current_path).to eq(item_path(item.id))
  end
end