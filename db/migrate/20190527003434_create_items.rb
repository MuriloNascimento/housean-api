# db/migrate/20190527003434_create_items.rb
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :category, foreign_key: true
      t.string :name, limit: 255
      t.decimal :price, precision: 12, scale: 2
      t.decimal :amount, precision: 12, scale: 2
      t.decimal :minimum_amount, precision: 12, scale: 2, null: false

      t.timestamps
    end
  end
end
