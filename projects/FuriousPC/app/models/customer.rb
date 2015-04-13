class Customer < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :identity, :phone, :direction, :postal_code, :city
end



def first_name
	"#{first_name}"
end

def last_name
	"#{last_name}"
end

def identity
	"#{identity}"
end

def phone
	"#{phone}"
end

def direction
	"#{direction}"
end

def postal_code
	"#{postal_code}"
end

def city
	"#{city}"
end