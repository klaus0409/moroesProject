require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MoroesBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Beijing'
    # 数据时间可能需要调整, 默认是 utc
    config.active_record.default_timezone = :local

    config.i18n.default_locale = 'zh-CN'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.assets false
      g.helper false
      g.factory_girl false
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
