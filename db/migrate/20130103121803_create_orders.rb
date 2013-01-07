class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :cart_number
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on
      t.integer :card_verification
      t.integer :product_id
      t.integer :user_id 
      t.timestamps
    end
  end
end
