class AddItemCoverColumn < ActiveRecord::Migration
 def up
	add_attachment :items, :cover_image
	end
	def down
	remove_attachment :items, :cover_image
	end
end