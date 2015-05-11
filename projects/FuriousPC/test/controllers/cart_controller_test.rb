require File.dirname(__FILE__) + '/../test_helper'

class CartControllerTest < ActionController::TestCase
  fixtures :providers, :manufacturers, :items

  test "add" do
  	assert_difference(CartItem, :count) do
  		post :add, :id => 1
  	end
  	assert_response :redirect
  	assert_redirected_to :controller => 'catalog'
  	assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end
  
  test "remove" do
    post :add, :id => 1
    assert_equal [Item.find(1)], Cart.find(@request.session[:cart_id]).items

    post :remove, :id => 1
    assert_equal [], Cart.find(@request.session[:cart_id]).items
  end

  test "clear" do
    post :add, :id => 1
    assert_equal [Item.find(1)], Cart.find(@request.session[:cart_id]).items

    post :clear
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal [], Cart.find(@request.session[:cart_id]).items
  end
end
