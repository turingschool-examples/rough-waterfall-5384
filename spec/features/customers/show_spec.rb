require 'rails_helper'

RSpec.describe Customer, type: :feature do
  let!(:supermkt) { Supermarket.create(name: 'Wallys Mart') }
  let!(:supermkt_2) { Supermarket.create(name: 'Superior Market') }
  let!(:item_1) { Item.create!(name: 'Milk', price: 330) }
  let!(:item_2) { Item.create!(name: 'Eggs', price: 200) }
  let!(:customer_1) { Customer.create!(name: 'John', supermarket_id: supermkt.id, item_id: item_1.id) }

  before do
    visit customer_path(customer_1)
  end
  
  describe 'show page' do
    it 'should show the a list of its items' do
      customer_2 = Customer.create!(name: 'Barbara', supermarket_id: supermkt.id, item_id: item_2.id)
      item_3 = Item.create!(name: 'Bread', price: 100, customer_id: customer_1.id)

      expect(page).to have_content(customer_1.name)
      expect(page).not_to have_content(customer_2.name)
      expect(page).to have_content(supermkt.name)
      expect(page).not_to have_content(supermkt_2.name)

      within "ul" do
        expect(page).to have_content(item_1.name)
        expect(page).to have_content(item_3.name)
        expect(page).to have_content(item_1.price)
        expect(page).to have_content(item_3.price)
        expect(page).not_to have_content(item_2.name)
        expect(page).not_to have_content(item_2.price)
      end
    end
  end
end
