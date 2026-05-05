# frozen_string_literal: true

require 'test_helper'

class SupportRequestMailerTest < ActionMailer::TestCase
  test 'respond' do
    support_request = support_requests(:one)

    mail = SupportRequestMailer.respond(support_request)

    assert_equal [support_request.email], mail.to
    assert_equal "Re: #{support_request.subject}", mail.subject
  end
end
