class Manufacturer < ActiveRecord::Base
	validates_presence_of :name, :tlf, :direction, :phone
def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
  end
end
end

def name
	"#{name}"
end

def tlf
	"#{tlf}"
end

def direction
	"#{direction}"
end

def phone
	"#{phone}"
end

def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
  end
end
