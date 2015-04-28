class Provider < ActiveRecord::Base
  has_and_belongs_to_many :items
  validates_presence_of :name, :tlf, :phone, :direction
end
