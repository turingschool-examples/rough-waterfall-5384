class CreateCustomersItems < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_items do |t|
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
