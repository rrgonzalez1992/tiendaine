class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
	t.column :name, :string
	t.column :tlf, :string
	t.column :direction, :string
	t.column :phone, :string
      t.timestamps
    end
  end
end
