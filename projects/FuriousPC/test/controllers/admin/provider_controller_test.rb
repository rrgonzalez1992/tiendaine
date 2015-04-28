require File.dirname(__FILE__) + '/../../test_helper'

class Admin::ProviderControllerTest < ActionController::TestCase
  fixtures :providers
  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_providers = Provider.count
    post :create, :provider => {:name => 'ProveedorTest',:tlf => '1-NVIDIA-12345', :direction =>'Direccion ProveedorTest', :phone => '2-NVIDIA-12345'}
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_providers + 1, Provider.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => {:name => 'provider[name]', :value => 'IberiaComputer'}
    assert_tag :tag => 'input', :attributes => {:name => 'provider[tlf]', :value => '900111222'}
    assert_tag :tag => 'input', :attributes => {:name => 'provider[phone]', :value => '644455588'}
    assert_tag :tag => 'input', :attributes => {:name => 'provider[direction]', :value => 'Pol Industrial Tal'}
  end

  test "update" do
    post :update, :id => 1, :provider => {:name => 'IberiaCompTest', 
                :tlf => '000000000',
                          :phone => '000000000',
                          :direction => 'Direccion IberiaCompTest'}
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'IberiaCompTest', Provider.find(1).name
    assert_equal '000000000', Provider.find(1).tlf
    assert_equal '000000000', Provider.find(1).phone
    assert_equal 'Direccion IberiaCompTest', Provider.find(1).direction
  end

  test "destroy" do
    assert_difference(Provider, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'El proveedor IberiaComputer ha sido dado de baja'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'El proveedor IberiaComputer ha sido dado de baja'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/provider/show'
    assert_not_nil assigns(:provider)
    assert assigns(:provider).valid?
    assert_tag "h1", :content => Provider.find(1).name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Provider.count + 1, :only => {:tag => 'tr'} }
    Provider.find_each do |m|
      assert_tag :tag => 'td', :content => m.name
    end
  end
end
