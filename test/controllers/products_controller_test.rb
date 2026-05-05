# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess::FixtureFile
  setup do
    @product = products(:one)
    @user = users(:one)
    login_as(@user)

    @product.image.attach(
      io: File.open(Rails.root.join('test/fixtures/files/ruby.jpg')),
      filename: 'ruby.jpg',
      content_type: 'image/jpeg'
    )
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url, params: {
        product: {
          title: "Unique Product #{Time.now.to_i}",
          description: @product.description,
          price: @product.price,
          image: fixture_file_upload(
            Rails.root.join('test/fixtures/files/ruby.jpg'),
            'image/jpeg'
          )
        }
      }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product), params: {
      product: {
        title: @product.title,
        description: @product.description,
        price: @product.price,
        image: fixture_file_upload(
          Rails.root.join('test/fixtures/files/ruby.jpg'),
          'image/jpeg'
        )
      }
    }
    assert_redirected_to product_url(@product)
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end

    assert_redirected_to products_url
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
