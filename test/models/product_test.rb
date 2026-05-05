# frozen_string_literal: true

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Product Listing Validation' do
    product = Product.new

    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end

  test 'product price must be positive' do
    product = Product.new(title: 'My Book Title',
                          description: 'yyy')

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'],
                 product.errors[:price]

    product.price = 0
    assert product.invalid?

    product.price = 1
    assert product.valid?
  end
end
