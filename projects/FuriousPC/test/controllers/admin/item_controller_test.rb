require 'test_helper'

class Admin::ItemControllerTest < ActionController::TestCase
  fixtures :items
  test "new" do
    get :new
    assert_response :success
  end

  test "createPROCESSOR" do
    # Crea un PROCESADOR
    num_items = item.count
    post :create, :item => {
        :type => 'Processor',
        :name => 'Procesador Prueba',
        :description => 'Es un procesador random',
        :imagepath => 'jnbjdhbsd',
        :price => '800€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => '2',
        :socket => 'FM3',
        :TDP => '50W',
        :number_cores => 4,
        :core_frequency => 2
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end


  test "createMOBO" do
    # Crea una PLACA BASE
    num_items = item.count
    post :create, :item => {
        :type => 'Mobo',
        :name => 'Placa Base Prueba',
        :description => 'Es una placa base para un procesador random',
        :imagepath => 'jnbjdhbsd',
        :price => '200€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => '1',
        :socket => 'FM3',
        :factor => 'mATX',
        :pci_version => 'PCI-e 2'
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "createGPU" do
    # Crea una TARJETA GRAFICA
    num_items = item.count
    post :create, :item => {
        :type => 'GPU',
        :name => 'Tarjeta grafica Prueba',
        :description => 'Es una tarjeta grafica random',
        :imagepath => 'jnbjdhbsd',
        :price => '110€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => '1',
        :TDP => '50W',
        :core_frequency => 2,
        :video_memory => 1,
        :pci_version => 'Cualquiera',
        :watt: 100
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "createPSU" do
    # Crea una FUENTE DE ALIMENTACION
    num_items = item.count
    post :create, :item => {
        :type => 'PSU',
        :name => 'Fuente de alimentacion Prueba',
        :description => 'Es una fuente de alimentacion random',
        :imagepath => 'jnbjdhbsd',
        :price => '110€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => '2',
        :TDP => '50W',
        :watt: 100
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => {:name => 'item[first_name]', :value => 'Enrique'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[last_name]', :value => 'Arauz'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[identity]', :value => '32065158F'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[phone]', :value => '685838858'}

    # Primero se comprueban en linea los datos generales. A continuacion, seg´un type (if type....) se
    # discriminan los que deben aparecer como vacios y los que no
    
    assert_tag :tag => 'input', :attributes => {:name => 'item[direction]', :value => 'C/ Mi Calle nº 5'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[postal_code]', :value => '11406'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[city]', :value => 'Jerez de la Frontera'}
  end

  test "update" do
    post :update, :id => 1, :item => {
      :first_name => 'Cliente33',
      :last_name => 'Test33',
      :identity => '00000000X',
      :phone => '956000000',
      :direction => 'Calle de Test',
      :postal_code => '11001',
      :city => 'Test Land'}
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Cliente33', Item.find(1).first_name
    assert_equal 'Test33', Item.find(1).last_name
    assert_equal '00000000X', Item.find(1).identity
    assert_equal '956000000', Item.find(1).phone
    assert_equal 'Calle de Test', Item.find(1).direction
    assert_equal '11001', Item.find(1).postal_code
    assert_equal 'Test Land', Item.find(1).city
  end

  test "destroy" do
    assert_difference(item, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Se ha borrado el articulo Enrique Arauz.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'Se ha borrado el articulo Enrique Arauz.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/item/show'
    assert_not_nil assigns(:item)
    assert assigns(:item).valid?
    assert_tag "h1", :content => Item.find(1).first_name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Item.count + 1, :only => {:tag => 'tr'} }
    Item.find_each do |i|
      assert_tag :tag => 'td', :content => i.first_name
    end
  end
end