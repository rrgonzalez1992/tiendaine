require File.dirname(__FILE__) + '/../test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "failing_create" do
  	manufacturer = Manufacturer.new
  	assert_equal false, manufacturer.save
	assert manufacturer.errors[:name]
	assert manufacturer.errors[:tlf]
	assert manufacturer.errors[:phone]
	assert manufacturer.errors[:direction]
  end

  test "create" do
  	manufacturer = Manufacturer.new(
  		:name => 'Prueba',
  		:tlf => '900000000',
  		:phone => '000000009',
  		:direction => 'Direccion prueba'
  		)
  	assert manufacturer.save
  end
end
