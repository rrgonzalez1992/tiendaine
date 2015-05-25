require File.dirname(__FILE__) + '/../test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest

  def setup
    User.create(:name => 'Enrique Arauz', :login => 'earauz', :email => 'arauz@furiouspc.net',
                :password => 'admin', :password_confirmation => 'admin')
  end

  test "successful_login" do
    enrique = new_session_as(:enrique)
    enrique.tries_to_go_to_admin
    enrique.logs_in_succesfully("earauz", "admin")
  end

  test "failed_login" do
    ramon = new_session_as(:ramon)
    ramon.tries_to_go_to_admin
    ramon.fails_login("ramon", "nimda")
  end

  private

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def tries_to_go_to_admin
      get '/admin/item/new'
      assert_response :redirect
      assert_redirected_to '/user_sessions/new'
    end

    def logs_in_succesfully(login, password)
      post_login(login, password)
      assert_response :redirect
      assert_redirected_to '/admin/item/new'
    end

    def fails_login(login, password)
      post_login(login, password)
      assert_response :success
      assert_template 'user_sessions/new'
      assert_tag :tag => 'div', :attributes => { :id => 'errorExplanation' }
      assert_tag :tag => 'li', :content => 'Login is not valid'
    end

    private

    def post_login(login, password)
      post '/user_sessions/create', :user_session => { :login => login, :password => password }
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
