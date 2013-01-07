class CreateCustomerVisits < ActiveRecord::Migration
  def self.up
    create_table :customer_visits do |t|
      t.integer :customer_id
      t.integer :product_id      
      t.string :serial_no
      t.string :prod_color
      t.string :issue_type
      t.string :issue_title
      t.text :issue_details
      
      t.timestamps
    end
  end

  def self.down
    drop_table :customer_visits
  end
end