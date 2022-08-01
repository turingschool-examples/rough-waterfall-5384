Supermarket.destroy_all
Customer.destroy_all
Item.destroy_all

supermarket_1 = Supermarket.create!(name: 'Wallys Mart')
supermarket_2 = Supermarket.create!(name: 'Superior Market')

customer_1 = Customer.create!(name: 'John', supermarket_id: supermarket_1.id)
customer_2 = Customer.create!(name: 'Barbara', supermarket_id: supermarket_1.id)
customer_3 = Customer.create!(name: 'Sally', supermarket_id: supermarket_2.id)
customer_4 = Customer.create!(name: 'Joe', supermarket_id: supermarket_2.id)

item_1 = Item.create!(name: 'Milk', price: 330)
item_2 = Item.create!(name: 'Eggs', price: 200)
item_3 = Item.create!(name: 'Bread', price: 100)
item_4 = Item.create!(name: 'Coffee', price: 50)
item_5 = Item.create!(name: 'Tea', price: 30)

item_1.customers << customer_1
item_1.customers << customer_2
item_1.customers << customer_3
item_2.customers << customer_1
item_3.customers << customer_1
item_4.customers << customer_2
item_4.customers << customer_3
item_4.customers << customer_4
item_5.customers << customer_1