class Item < ActiveRecord::Base
	validates_presence_of :name, :description, :imagepath, :price, :weight, :dimensions, :id_manufacturer
end

def name
	"#{name}"
end

def description
	"#{description}"
end

def imagepath
	"#{imagepath}"
end

def price
	"#{price}"
end

def weight
	"#{weight}"
end

def dimensions
	"#{dimensions}"
end

def id_manufacturer
	"#{id_manufacturer}"
end

def socket
	"#{socket}"
end

def TDP
	"#{TDP}"
end

def number_cores
	"#{number_cores}"
end

def core_frequency
	"#{core_frequency}"
end

def video_memory
	"#{video_memory}"
end

def watts
	"#{watts}"
end