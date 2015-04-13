require File.dirname(__FILE__) + '/../../test_helper'

class Admin::CustomerControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :customers
  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_customers = Customer.count
    post :create, :customer => {
	    	:first_name => 'Cliente',
	    	:last_name => 'Test',
	    	:identity => '12345678L',
	    	:phone => '956000000',
	    	:direction => 'Calle',
	    	:postal_code => '11000',
	    	:city => 'Ciudad'}
	    	
    	  assert_response :redirect
    	  assert_redirected_to :action => 'index'
    	  assert_equal num_customers + 1, Customer.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => {:name => 'customer[first_name]', :value => 'Enrique'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[last_name]', :value => 'Arauz'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[identity]', :value => '32065158F'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[phone]', :value => '685838858'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[direction]', :value => 'C/ Mi Calle nº 5'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[postal_code]', :value => '11406'}
    assert_tag :tag => 'input', :attributes => {:name => 'customer[city]', :value => 'Jerez de la Frontera'}
  end

  test "update" do
    post :update, :id => 1, :customer => {
    	:first_name => 'Cliente33',
    	:last_name => 'Test33',
    	:identity => '00000000X',
    	:phone => '956000000',
    	:direction => 'Calle de Test',
    	:postal_code => '11001',
    	:city => 'Test Land'}
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Cliente33', Customer.find(1).first_name
    assert_equal 'Test33', Customer.find(1).last_name
    assert_equal '00000000X', Customer.find(1).identity
    assert_equal '956000000', Customer.find(1).phone
    assert_equal 'Calle de Test', Customer.find(1).direction
    assert_equal '11001', Customer.find(1).postal_code
    assert_equal 'Test Land', Customer.find(1).city
  end

  test "destroy" do
    assert_difference(Customer, :count, -1) do
    	post :destroy, :id => 1
    	assert_equal flash[:notice], 'Se ha borrado el cliente Enrique Arauz.'
    	assert_response :redirect
    	assert_redirected_to :action => 'index'
    	get :index
    	assert_response :success
    	assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'Se ha borrado el cliente Enrique Arauz.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/customer/show'
    assert_not_nil assigns(:customer)
    assert assigns(:customer).valid?
    assert_tag "h1", :content => Customer.find(1).first_name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Customer.count + 1, :only => {:tag => 'tr'} }
  	Customer.find_each do |c|
  		assert_tag :tag => 'td', :content => c.first_name
  	end
  end
end
