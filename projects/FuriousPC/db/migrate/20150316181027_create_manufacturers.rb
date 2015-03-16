class CreateManufacturers < ActiveRecord::Migration
  def self.up
    create_table :manufacturers do |t|
	t.column :name, :string
	t.column :tlf, :string
	t.column :direction, :string
	t.column :phone, :string
      t.timestamps
    end
  end
  def self.down
    drop_table :manufacturers
  end
end
