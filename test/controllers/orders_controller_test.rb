# frozen_string_literal: true

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @user = users(:one)
    login_as(@user)
  end

  test 'requires item in cart' do
    get new_order_url
    assert_redirected_to store_index_path
    assert_equal 'Your cart is empty', flash[:notice]
  end
  test 'should get new' do
    post line_items_url, params: { product_id: products(:ruby).id }
    get new_order_url
    assert_response :success
  end

  test 'should create order' do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @order.address,
                                          email: @order.email, name: @order.name,
                                          pay_type: @order.pay_type } }
    end
    assert_redirected_to store_index_url
  end
end
