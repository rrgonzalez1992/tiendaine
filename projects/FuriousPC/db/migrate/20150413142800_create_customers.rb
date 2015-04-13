class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :identity, :string
      t.column :phone, :string
      t.column :direction, :string
      t.column :postal_code, :string
      t.column :city, :string
      t.timestamps
    end
  end
end
