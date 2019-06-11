# db/migrate/20190527000905_create_categories.rb
class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, limit: 255

      t.timestamps
    end
  end
end
