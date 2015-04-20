class Providers < ActiveRecord::Base
	has_and_belongs_to_many :item
	validates_presence_of :name, :tlf, :direction, :phone
end
