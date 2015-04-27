require 'test_helper'

class Admin::ItemControllerTest < ActionController::TestCase
  fixtures :items
  test "new" do
    get :new
    assert_response :success
  end

  test "createPROCESSOR" do
    # Crea un PROCESADOR
    num_items = Item.count
    post :create, :item => {
        :tipo => 'Processor',
        :name => 'Procesador Prueba',
        :description => 'Es un procesador random',
        :price => '800€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 2,
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
    num_items = Item.count
    post :create, :item => {
        :tipo => 'Mobo',
        :name => 'Placa Base Prueba',
        :description => 'Es una placa base para un procesador random',
        :price => '200€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 1,
        :socket => 'FM3',
        :factor => 'mATX',
        :pci_version => 'PCI-e 2',
        :chipset => '990X'
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "createGPU" do
    # Crea una TARJETA GRAFICA
    num_items = Item.count
    post :create, :item => {
        :tipo => 'GPU',
        :name => 'Tarjeta grafica Prueba',
        :description => 'Es una tarjeta grafica random',
        :price => '110€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 1,
        :TDP => '50W',
        :core_frequency => 2,
        :video_memory => 1,
        :pci_version => 'Cualquiera',
        :watts => 100
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "createPSU" do
    # Crea una FUENTE DE ALIMENTACION
    num_items = Item.count
    post :create, :item => {
        :tipo => 'PSU',
        :name => 'Fuente de alimentacion Prueba',
        :description => 'Es una fuente de alimentacion random',
        :price => '110€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 2,
        :TDP => '50W',
        }
        
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_equal num_items + 1, item.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => {:name => 'item[name]', :value => 'AMD FX-8350'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[description]', :value => 'For advanced gaming and multimedia experience AMD brings his new eight-core processor overclockeable'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[price]', :value => '150€'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[weight]', :value => '0.7502kg'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[dimensions]', :value => '20x20x20 cm'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[id_manufacturer]', :value => 2}

    # Primero se comprueban en linea los datos generales. A continuacion, segun tipo (if tipo....) se
    # discriminan los que deben aparecer como vacios y los que no
    
    assert_tag :tag => 'input', :attributes => {:name => 'item[tipo]', :value => 'Processor'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[socket]', :value => 'AM3+'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[TDP]', :value => '150W'}
    assert_tag :tag => 'input', :attributes => {:name => 'item[number_cores]', :value => 8}
    assert_tag :tag => 'input', :attributes => {:name => 'item[core_frequency]', :value => 4}
    assert_tag :tag => 'input', :attributes => {:name => 'item[pci_version]', :value => ''}
    assert_tag :tag => 'input', :attributes => {:name => 'item[watts]', :value => ''}
    assert_tag :tag => 'input', :attributes => {:name => 'item[factor]', :value => ''}
    assert_tag :tag => 'input', :attributes => {:name => 'item[video_memory]', :value => ''}
  end

  test "update" do
    post :update, :id => 1, :item => {
        :name => 'Test Processor',
        :description => 'Es un procesador random',
        :price => '800€',
        :weight => '1kg',
        :dimensions => '1x1x1cm',
        :id_manufacturer => 2,
        :socket => 'FM3',
        :TDP => '50W',
        :number_cores => 4,
        :core_frequency => 2
        }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Test Processor', Item.find(1).name
    assert_equal 'Es un procesador random', Item.find(1).description
    assert_equal '800€', Item.find(1).price
    assert_equal '1kg', Item.find(1).weight
    assert_equal '1x1x1cm', Item.find(1).dimensions
    assert_equal 2, Item.find(1).id_manufacturer
    assert_equal '50W', Item.find(1).TDP
    assert_equal 4, Item.find(1).number_cores
    assert_equal 2, Item.find(1).core_frequency
    assert_equal 'FM3', Item.find(1).socket
  end

  test "destroy" do
    assert_difference(Item, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Se ha borrado el articulo AMD FX-8350.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'Se ha borrado el articulo AMD FX-8350.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/item/show'
    assert_not_nil assigns(:item)
    assert assigns(:item).valid?
    assert_tag "h1", :content => Item.find(1).name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Item.count + 1, :only => {:tag => 'tr'} }
    Item.find_each do |i|
      assert_tag :tag => 'td', :content => i.name
    end
  end
end

