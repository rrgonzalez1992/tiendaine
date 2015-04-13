require File.dirname(__FILE__) + '/../test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "failing_create" do
  	customer = Customer.new
  	assert_equal false, customer.save
	assert customer.errors[:first_name]
	assert customer.errors[:last_name]
	assert customer.errors[:identity]
	assert customer.errors[:phone]
	assert customer.errors[:direction]
	assert customer.errors[:postal_code]
	assert customer.errors[:city]
  end

  test "create" do
  	customer = Customer.new(
  		:first_name => 'Kike',
  		:last_name => 'Arauz Morales',
  		:identity => '12312312Y',
  		:phone => '000000009',
  		:direction => 'Direccion prueba',
  		:postal_code => '11406',
  		:city => 'London'
  		)
  	assert customer.save
  end
end
