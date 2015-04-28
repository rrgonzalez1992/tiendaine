require File.dirname(__FILE__) + '/../test_helper'

class ProviderTest < ActiveSupport::TestCase
  fixtures :providers

  def test_name
  	proveedor = Provider.create(
		:name => 'Telecom',
	  	:tlf => '900111222',
	  	:phone => '644455588',
	  	:direction => 'C/ Sol'
  		)
  	assert_equal 'Telecom', proveedor.name
  end
end
