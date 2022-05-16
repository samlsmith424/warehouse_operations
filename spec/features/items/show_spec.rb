require 'rails_helper'

RSpec.describe 'Item Show Page' do
  it 'can display the item attributes' do
    item = FactoryBot.create(:item)
    visit item_path(item)

    expect(page).to have_content("Inventory Items")
    expect(items.count).to eq(3)
    # items.each do |item|
    #   expect(item.name).to be_a(String)
    #   expect(item.description).to be_a(String)
    #   expect(item.price).to be_a(Float)
    # end
  end
end
