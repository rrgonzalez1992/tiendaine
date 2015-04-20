class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
		t.column :name, :string
		t.column :tlf, :string
		t.column :direction, :string
		t.column :phone, :string
	      t.timestamps
  	end

  	create_table :providers_items, :id => false do |t|
		t.column :provider_id, :integer, :null => false
		t.column :item_id, :integer, :null => false
	end

	say_with_time 'Adding foreign keys' do
		# Add foreign key reference to books_authors table
		execute 'ALTER TABLE providers_items ADD CONSTRAINT fk_it_providers
		FOREIGN KEY ( provider_id ) REFERENCES providers( id ) ON DELETE CASCADE'
		execute 'ALTER TABLE providers_items ADD CONSTRAINT fk_pr_items
		FOREIGN KEY ( item_id ) REFERENCES items( id ) ON DELETE CASCADE'
  	end
  end
  	def self.down
		drop_table :providers_items
		drop_table :providers
	end
end
