require 'rails_helper'

RSpec.describe Item, type: :feature do
  let!(:supermarket_1) { Supermarket.create!(name: 'Wallys Mart') }
  let!(:supermarket_2) { Supermarket.create!(name: 'Superior Market') }

  let!(:customer_1) { Customer.create!(name: 'John', supermarket: supermarket_1) }
  let!(:customer_2) { Customer.create!(name: 'Mary', supermarket: supermarket_2) }

  let!(:item_1) { Item.create!(name: 'Milk', price: 330) }
  let!(:item_2) { Item.create!(name: 'Eggs', price: 200) }
  let!(:item_3) { Item.create!(name: 'Bread', price: 100) }

  describe 'index page' do
    it 'should display a list of the supermarkets items' do
      item_1.customers << customer_1
      item_2.customers << customer_1
      item_3.customers << customer_2
      item_1.customers << customer_2

      supermarket_1.customers << customer_1
      supermarket_1.customers << customer_2

      visit supermarket_path(supermarket_1.id)

      expect(page).to have_link('View All Items', href: supermarket_items_path(supermarket_1.id))

      click_link 'View All Items'

      expect(current_path).to eq(supermarket_items_path(supermarket_1.id))

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.price)
      expect(page).not_to have_content(item_3.name)
      expect(page).not_to have_content(item_3.price)
    end
  end
end
  
