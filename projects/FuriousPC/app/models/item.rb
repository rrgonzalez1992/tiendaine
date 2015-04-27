class Item < ActiveRecord::Base
	has_and_belongs_to_many :providers
	belongs_to :manufacturer

	has_attached_file :cover_image
	validates_attachment :cover_image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }


	validates_length_of :name, :in => 1..255
	validates_length_of :description, :in => 1..255
	validates_presence_of :providers
	validates_presence_of :manufacturer
	validates_presence_of :price
	validates_presence_of :weight
	validates_length_of :dimensions, :in => 1..255
	validates_presence_of :number_cores
	validates_presence_of :core_frequency
	validates_length_of :socket, :in => 1..255
	validates_length_of :TDP, :in => 1..255
	validates_presence_of :watts


  def provider_names
    self.providers.map{|provider| provider.name}.join(", ")
  end

  def self.latest(num)
    all.order("items.id desc").includes(:providers, :manufacturer).limit(num)
  end
end
