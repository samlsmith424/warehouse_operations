require 'rails_helper'

RSpec.describe 'Item Show Page' do
  it 'can display the item attributes' do
    item = FactoryBot.create(:item)

    visit item_path(item)

    expect(page).to have_content("Item Information")
    expect(page).to have_content(item.name)
    expect(item.name).to be_a(String)

    expect(page).to have_content(item.description)
    expect(item.description).to be_a(String)

    expect(page).to have_content(item.price)
    expect(item.price).to be_a(Float)
  end
end
