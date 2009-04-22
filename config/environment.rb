# ENV['RAILS_ENV'] ||= 'production'
RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  config.action_controller.session = {
    :session_key => '_bancote_session',
    :secret      => 'c9498cb3ece2b1e0514dbb68828622f2ddd80f162ca8396addb3579e0d3238ff2a2249b9f1325f326a7e0d3a33d5122c2c4443a49ce2d35e9818b21ce4da2324'
  }
  config.active_record.observers = :user_observer, :mensaje_observer
end