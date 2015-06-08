require File.dirname(__FILE__) + '/../test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  fixtures :manufacturers, :providers, :items, :items_providers

  test "browse" do
    enrique = new_session_as :enrique
    enrique.index
    enrique.second_page
    enrique.items_details 'nVidia GTX 980'
    enrique.latest_items
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get 'catalog/index'
      assert_response :success
      assert_tag :tag => 'dl', :attributes => { :id => 'items' },
                 :children => { :count => 2, :only => { :tag => 'dt' }}
      assert_tag :tag => 'dt', :content => 'nVidia GTX 980'
      check_item_links
    end

    def second_page
      get 'catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Item.find_by_name('Pro Rails E-Commerce'),
                   assigns(:items).last
      check_item_links
    end
  end

  def items_details(name)
    @item = Item.where(:name => name).first
    get "catalog/show/#{@item.id}"
    assert_response :success
    assert_template 'catalog/show'
    assert_tag :tag => 'h1', :content => @item.name
    assert_tag :tag => 'h2', :content => "de #{@item.providers.map{|a| a.name}.join(", ")}"
  end

  def check_item_links
    for item in assigns :items
      assert_tag :tag => 'a', :attributes => { :href => "/catalog/show/#{item.id}" }
    end
  end

  def latest_items
    get 'catalog/latest'
    assert_response :success
    assert_template 'catalog/latest'
    assert_tag :tag => 'dl', :attributes => { :id => 'items' },
               :children => { :count => 2, :only => { :tag => 'dt' } }
    @items = Item.latest(5)
    @items.each do |a|
      assert_tag :tag => 'dt', :content => a.name
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
