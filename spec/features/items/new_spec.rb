require 'rails_helper'

 RSpec.describe 'New Item' do
   it 'has a button to add a new inventory item' do
     visit items_path

     expect(page).to have_button("Add New Item")

     click_on("Add New Item")

     expect(current_path).to eq(new_item_path)
     expect(page).to have_content("Create New Item")
   end
 end
