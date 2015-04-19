class Manufacturer < ActiveRecord::Base
  has_many :items
	validates_presence_of :name, :tlf, :direction, :phone
end
