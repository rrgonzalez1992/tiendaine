class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :imagepath, :string
      t.column :price, :string
      t.column :weight, :string
      t.column :dimensions, :string
      t.column :id_manufacturer, :integer
      t.column :socket, :string
      t.column :TDP, :string
      t.column :number_cores, :integer
      t.column :core_frequency, :integer
      t.column :factor, :string
      t.column :video_memory, :integer
      t.column :watts, :integer
      t.timestamps
    end
  end
end
