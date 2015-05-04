require File.dirname(__FILE__) + '/../test_helper'
require 'catalog_controller'

# Re-raise errors caught by the controller.
class CatalogController; def rescue_action(e) raise e end; end

class CatalogControllerTest < ActionController::TestCase
	fixtures :items, :providers, :manufacturers, :items_providers

  setup do
    @controller = CatalogController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'catalog/show'
  end

  test "should get latest" do
    get :latest
    assert_response :success
  end

end
