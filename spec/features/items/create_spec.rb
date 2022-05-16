require "rails_helper"

RSpec.describe "Create Item" do
  it 'can create a new item after filling in a form' do
    visit new_item_path

    fill_in "Name", with: "Ice cream maker"
    fill_in "Description", with: "Makes delicious frozen treats"
    fill_in "Price", with: 109.20
    click_on("Submit")

    expect(current_path).to eq(items_path)
    expect(page).to have_content("Ice cream maker")
  end

  it 'receives  feedback if form is not properly filled in' do
    visit new_item_path

    fill_in "Name", with: "Ice cream maker"
    fill_in "Description", with: 10000
    fill_in "Price", with: "String"
    click_on("Submit")

    expect(current_path).to eq(new_item_path)
    expect(current_path).to_not eq(items_path)
    expect(page).to have_content("Please properly fill in all fields")
  end

  it 'receives feedback if a field is left blank' do
    visit new_item_path

    fill_in "Name", with: "Cheese grater"
    fill_in "Description", with: "Who doesn't love grate cheese?"
    fill_in "Price", with:
    click_on("Submit")

    expect(current_path).to_not eq(items_path)
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Please properly fill in all fields")
  end
end
