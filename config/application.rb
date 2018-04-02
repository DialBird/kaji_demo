require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kaji2
  class Application < Rails::Application
    config.load_defaults 5.1

    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.stylesheets false
      g.helper false
      g.decorator true
      g.test_framework :rspec, fixtures: true,
                               view_specs: false,
                               helper_specs: false,
                               routing_specs: false,
                               controller_specs: true,
                               request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
