require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ManufacturerControllerTest < ActionController::TestCase
  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_manufacturers = Manufacturer.count
    post :create, :manufacturer => {:name => 'Prueba',:tlf => '123456789', :direction =>'Direccion Prueba', :phone => '987654321'}
    	  assert_response :redirect
    	  assert_redirected_to :action => 'index'
    	  assert_equal num_manufacturers + 1, Manufacturer.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => {:name => 'manufacturer [name]', :value => 'Prueba Edit'}
    assert_tag :tag => 'input', :attributes => {:name => 'manufacturer [tlf]', :value => '111111111'}
    assert_tag :tag => 'input', :attributes => {:name => 'manufacturer [phone]', :value => '222222222'}
    assert_tag :tag => 'input', :attributes => {:name => 'manufacturer [direction]', :value => 'Prueba Direccion Edit'}
  end

  test "update" do
    post :update, :id => 1, :manufacturer => {:name => 'Prueba Update',
    										  :tlf => '333333333',
    										  :phone => '444444444',
    										  :direction => 'Prueba Direccion Update'}
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Prueba Update', Manufacturer.find(1).name
    assert_equal '333333333', Manufacturer.find(1).tlf
    assert_equal '444444444', Manufacturer.find(1).phone
    assert_equal 'Prueba Direccion Update', Manufacturer.find(1).direction
  end

  test "destroy" do
    assert_difference(Manufacturer, :count, -1) do
    	post :destroy, :id => 1
    	assert_equal flash[:notice], 'Se ha borrado el fabricante'
    	assert_response :redirect
    	assert_redirected_to :action => 'index'
    	get :index
    	assert_response :success
    	assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'Se ha borrado el fabricante.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'manufacturer/show'
    assert_tag "h1", :content => Manufacturer.find(1).name
    assert_not_nil assigns(:manufacturer)
    assert assigns(:manufacturer).valid?
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag=> 'table', :children => { :count => Manufacturer.count + 1, :only => {:tag => 'tr'} }
  	Manufacturer.find_each do |m|
  		assert_tag :tag => 'td', :content => m.name
  		assert_tag :tag => 'td', :content => m.tlf
  		assert_tag :tag => 'td', :content => m.phone
  		assert_tag :tag => 'td', :content => m.direction
  	end
  end
end
