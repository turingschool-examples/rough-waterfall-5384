require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many :customers }
  end
end
