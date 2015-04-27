require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "failing_create" do
  	item = Item.new
  	assert_equal false, item.save
	assert item.errors[:name]
	assert item.errors[:description]
	assert item.errors[:tipo]
	assert item.errors[:price]
	assert item.errors[:weight]
	assert item.errors[:dimensions]
	assert item.errors[:id_item]
	assert item.errors[:socket]
	assert item.errors[:TDP]
	assert item.errors[:number_cores]
	assert item.errors[:core_frequency]
	assert item.errors[:factor]
	assert item.errors[:video_memory]
	assert item.errors[:pci_version]
	assert item.errors[:watts]

  end

  test "create" do
  	item = Item.new(
  		:name => 'Test creacion procesador',
        :description => 'Es un procesador de test',
        :price => '800€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 2,
        :socket => 'FM3',
        :TDP => '50W',
        :number_cores => 4,
        :core_frequency => 2
  		)
  	assert item.save
  end
end
