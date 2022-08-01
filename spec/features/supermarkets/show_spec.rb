require 'rails_helper'

RSpec.describe Supermarket, type: :feature do
  let!(:supermarket_1) { Supermarket.create!(name: 'Wallys Mart') }
  let!(:supermarket_2) { Supermarket.create!(name: 'Superior Market') }

  describe 'show page' do
    it 'should show the supermarket name' do
      visit supermarket_path(supermarket_1.id)

      expect(page).to have_content(supermarket_1.name)
      expect(page).not_to have_content(supermarket_2.name)
    end

    it 'should link to a list of its items' do
      visit supermarket_path(supermarket_1.id)

      expect(page).to have_link('View All Items', href: supermarket_items_path(supermarket_1.id))
    end
  end
end
  
