class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.date :years_of_launch
      t.boolean :status
      t.integer :product_category_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end