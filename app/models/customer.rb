class Customer < ApplicationRecord
  belongs_to :supermarket
  has_and_belongs_to_many :items

  validates_presence_of :name

  def total_cost
    (items.sum(:price) / 100.0).round(2)
  end
end