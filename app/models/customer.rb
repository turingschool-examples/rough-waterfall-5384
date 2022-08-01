class Customer < ApplicationRecord
  belongs_to :supermarket
  has_and_belongs_to_many :items
end