require 'test_helper'

class Item < ActiveRecord::Base
 	belongs_to :manufacturer
+	has_and_belongs_to_many :providers
 
 	
 	validates_length_of :name, :in => 1..255
@@ -10,6 +11,9 @@ class Item < ActiveRecord::Base
 	validates_presence_of :weight
 	validates_presence_of :price
 	validates_presence_of :id_manufacturer
+	validates_presence_of :tipo
+	validates_presence_of :name
+	validates_presence_of :description
 end
 
 def name

