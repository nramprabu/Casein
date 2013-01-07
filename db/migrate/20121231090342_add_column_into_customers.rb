class AddColumnIntoCustomers < ActiveRecord::Migration
  def up    
    rename_column :customers, :name, :first_name
    add_column :customers, :last_name, :string
  end

  def down
    rename_column :customers, :first_name, :name
    remove_column :customers, :last_name, :string
  end
end
