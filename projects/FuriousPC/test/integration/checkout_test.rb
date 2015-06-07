require File.dirname(__FILE__) + '/../test_helper'

class CheckoutTest < ActionDispatch::IntegrationTest
  fixtures :manufacturers, :providers, :items

  test "empty_cart_shows_error_message" do
    get '/checkout/index'
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal flash[:notice], 'Tu carrito de la compra está vacío! ' +
                                 'Por favor, añade al menos un producto a tu carrito de la compra antes de confirmar el pedido'
  end

  test "submitting_order" do
    post '/cart/add', :id => 1
    get '/checkout/index'
    assert_response :success
    assert_tag :tag => 'legend', :content => 'Información de contacto'
    assert_tag :tag => 'legend', :content => 'Dirección de entrega'
    assert_tag :tag => 'legend', :content => 'Información de facturación'

    post '/checkout/submit_order', :cart => { :id => Cart.last.id }, :order => {
      # Contact information
      :email => 'email@email.com',
      :phone_number => '666112233',
      # Shipping address
      :ship_to_first_name => 'Firstname',
      :ship_to_last_name => 'Lastname',
      :ship_to_address => 'Address',
      :ship_to_city => 'City',
      :ship_to_postal_code => '00000',
      :ship_to_country_code => 'Country',
      # Billing information
      :card_type => 'Visa',
      :card_number => '4007000000027',
      :card_expiration_month => '3',
      :card_expiration_year => '2018',
      :card_verification_value => '000'
    }

    assert_response :redirect
    assert_redirected_to '/checkout/thank_you'
  end
end
