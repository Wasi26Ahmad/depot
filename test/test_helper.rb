# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    fixtures :all
  end
end

module ActionDispatch
  class IntegrationTest
    def login_as(user)
      if respond_to? :visit
        visit login_url
        fill_in :name, with: user.name
        fill_in :password, with: 'secret'
        click_on 'Login'
      else
        post login_url, params: { name: user.name, password: 'secret' }
      end
    end

    def logout
      delete logout_url
    end
  end
end
