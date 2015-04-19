class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name, :limit => 255, :null => false
      t.string :description, :limit => 255, :null => false
      t.string :type, :limit => 255, :null => false
      t.decimal :price, :null => false
      t.decimal :weight, :null => false
      t.string :dimensions, :limit => 255, :null => false
      t.integer :id_manufacturer, :null => false
      t.string :socket, :limit => 255, :null => true
      t.string :TDP, :limit => 255, :null => true
      t.integer :number_cores, :null => true
      t.integer :core_frequency, :null => true
      t.string :factor, :limit => 255, :null => true
      t.integer :video_memory, :null => true
      t.integer :watts, :null => true
      t.timestamps
    end
     say_with_time 'Adding foreing keys' do
      # Add foreign key reference to authors_books table
      execute 'ALTER TABLE items ADD CONSTRAINT fk_item_manufacturer
              FOREIGN KEY (id_manufacturer) REFERENCES manufacturers(id) ON DELETE CASCADE'
      end
  end
  def self.down
    drop_table :items
  end
end
