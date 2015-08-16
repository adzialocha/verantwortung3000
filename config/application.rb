require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Darmstadt3000
  class Application < Rails::Application

    config.title = 'DARMSTADT 3000'

    config.assets.version = '1.0'
    config.assets.enable = true

    config.action_dispatch.cookies_serializer = :json
    config.filter_parameters += [:password]
    config.session_store :cookie_store, key: '_darmstadt3000_session'

    config.time_zone = 'Berlin'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en

    config.active_record.raise_in_transactional_callbacks = true

    config.encoding = 'utf-8'

  end
end
