require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Darmstadt3000
  class Application < Rails::Application

    # VERANTWORTUNG 3000

    config.title = 'VERANTWORTUNG 3000'
    config.description = 'Altwustrow ist ein Ort in Brandenburg. VERANTWORTUNG 3000 will eine Zusammenkunft in Altwustrow schaffen, 6 Tage im September 2016. VERANTWORTUNG 3000 versteht sich als Ort für konstruktiven Austausch und kritische Diskussion über zeitgenössische Musik.'
    config.url = 'http://www.verantwortung3000.de'

    config.FESTIVAL_START = Time.new 2016, 8, 30
    config.FESTIVAL_END = Time.new 2016, 9, 5

    # RAILS APPLICATION

    config.before_configuration do
      ENV.update YAML.load_file('config/application.yml')[Rails.env] rescue {}
    end

    config.assets.version = '1.0'
    config.assets.enable = true
    config.assets.precompile += ['edit.js']

    config.action_dispatch.cookies_serializer = :json
    config.filter_parameters += [:password]
    config.session_store :cookie_store, key: '_darmstadt3000_session'

    config.time_zone = 'Berlin'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :de
    config.i18n.available_locales = [:de, :en]
    config.i18n.enforce_available_locales = false

    config.active_record.raise_in_transactional_callbacks = true

    config.encoding = 'utf-8'

  end
end
