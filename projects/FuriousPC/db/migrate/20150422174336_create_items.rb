class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :limit => 255, :null => false
      t.string :description, :limit => 255, :null => false
      t.decimal :price, :null => false
      t.decimal :weight, :null => false
      t.string :dimensions, :limit => 255, :null => false
      t.integer :manufacturer_id, :null => false
      t.string :socket, :limit => 255, :null => true
      t.string :TDP, :limit => 255, :null => true
      t.integer :number_cores, :null => true
      t.integer :core_frequency, :null => true
      t.string :factor, :limit => 255, :null => true
      t.integer :video_memory, :null => true
      t.string :pci_version, :limit => 255, :null => true
      t.integer :watts, :null => true
      t.timestamps
    end
    create_table :items_providers do |t|
    	t.integer :provider_id, :null => false
    	t.integer :item_id, :null => false
    end
     say_with_time 'Adding foreing keys' do
      execute 'ALTER TABLE items ADD CONSTRAINT fk_item_manufacturer
              FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id) ON DELETE CASCADE'
      execute 'ALTER TABLE items_providers ADD CONSTRAINT fk_items_providers_items
              FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE'
     execute 'ALTER TABLE items_providers ADD CONSTRAINT fk_items_providers_providers
              FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE CASCADE'
      end
  end
  def self.down
    drop_table :items
  end
end