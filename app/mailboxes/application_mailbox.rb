# frozen_string_literal: true
class ApplicationMailbox < ActionMailbox::Base
  routing(/.*/i => :support)
end
