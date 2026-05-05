# frozen_string_literal: true

require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    login_as(@user)

    @product = products(:one)

    @product.image.attach(
      io: File.open(Rails.root.join('test/fixtures/files/ruby.jpg')),
      filename: 'ruby.jpg',
      content_type: 'image/jpeg'
    )
  end

  test 'should get index' do
    get admin_url
    assert_response :success
  end
end
