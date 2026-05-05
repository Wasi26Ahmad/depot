# frozen_string_literal: true

require 'test_helper'

class SupportRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_request = support_requests(:one)
    @user = users(:one)
    login_as(@user)
  end

  test 'should get index' do
    get support_requests_url
    assert_response :success
  end

  test 'should update support_request' do
    patch support_request_url(@support_request), params: {
      support_request: { response: 'Test response' }
    }
    assert_redirected_to support_requests_url
  end
end
