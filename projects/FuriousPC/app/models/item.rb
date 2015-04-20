class Item < ActiveRecord::Base
	belongs_to :manufacturer
	has_and_belongs_to_many :providers

	
	validates_length_of :name, :in => 1..255
	validates_length_of :description, :in => 1..255
	validates_length_of :dimensions, :in => 1..255
	validates_length_of :tipo, :in =>1..255
	validates_length_of :pci_version, :in =>1..255
	validates_presence_of :weight
	validates_presence_of :price
	validates_presence_of :id_manufacturer
	validates_presence_of :tipo
	validates_presence_of :name
	validates_presence_of :description
end

def name
	"#{name}"
end

def description
	"#{description}"
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

def pci_version
	"#{pci_version}"
end

def chipset
	"#{chipset}"
end

def watts
	"#{watts}"
end

def factor
	"#{factor}"
end