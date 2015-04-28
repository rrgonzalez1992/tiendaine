require File.dirname(__FILE__) + '/../test_helper'

class ItemTest < ActiveSupport::TestCase

  fixtures :manufacturers, :providers, :items, :items_providers
  
  def test_create
    item = Item.new(
        :name => 'AMD A10-7850K',
        :description => 'Fastest APU ever combining for cores with a powerful AMD R7-270',
        :price => 130,
        :weight => 0.7502,
        :dimensions => '20x20x20 cm',
        :manufacturer_id => Manufacturer.find(1).id,
        :provider_ids => Provider.find(1).id,
        :socket => 'FM2',
        :TDP => 100,
        :number_cores => 4,
        :core_frequency => 3,
      )
    assert item.save
  end

  def test_failing_create
    item = Item.new
    assert_equal false, item.save
    assert_equal 12, item.errors.size
    
    assert item.errors.on(:name)
    assert item.errors.on(:description)
    assert item.errors.on(:price)
    assert item.errors.on(:weight)
    assert item.errors.on(:dimensions)
    assert item.errors.on(:manufacturer_id)
    assert item.errors.on(:provider_ids)
    assert item.errors.on(:socket)
    assert item.errors.on(:TDP)
    assert item.errors.on(:number_cores)
    assert item.errors.on(:core_frequency)
  end
  
  def test_has_many_and_belongs_to_mapping
    fabricante = Manufacturer.find_by_name("Intel")
    assert_equal 1, fabricante.items.size
    
    item = Item.new(
        :name => 'Intel Core i7 4750',
        :description => 'One random Intel processor',
        :price => 250,
        :weight => 0.5502,
        :dimensions => '20x20x20 cm',
        :manufacturer_id => Manufacturer.find(1).id,
        :provider_ids => [Provider.find(1).id, Provider.find(2).id],
        :socket => 'FM2',
        :TDP => 100,
        :number_cores => 4,
        :core_frequency => 3,
      )
    
    fabricante.items << item
    
    fabricante.reload
    item.reload
    
    assert_equal 3, fabricante.items.size
    assert_equal 'Item', item.manufacturer.name
  end
  
  def test_has_and_belongs_to_many_providers_mapping
    item = Item.new(
        :name => 'AMD A8-6900',
        :description => 'Random APU combining for cores with a powerful AMD R7-270',
        :price => 50,
        :weight => 0.7502,
        :dimensions => '20x20x20 cm',
        :manufacturer_id => Manufacturer.find(2).id,
        :provider_ids => [Provider.find(1).id, Provider.find(2).id],
        :socket => 'FM2',
        :TDP => 100,
        :number_cores => 4,
        :core_frequency => 3,
      )
    
    assert item.save
    
    item.reload
    
    assert_equal 2, item.providers.size
    assert_equal 2, Provider.find(2).items.size
  end
end
