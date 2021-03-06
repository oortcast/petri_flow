# frozen_string_literal: true

module Wf
  class Engine < ::Rails::Engine
    isolate_namespace Wf
    config.autoload_paths += %W[
      #{config.root}/app/models/wf/concerns
    ]

    config.to_prepare do
      require_dependency(Rails.root + "config/initializers/wf_config.rb")
    rescue LoadError
      puts("config/initializers/wf_config.rb not found.")
    end
  end
end

require "bootstrap"
require "bootstrap4-kaminari-views"
require "jquery-rails"
require "kaminari"
require "simple_command"
require "loaf"
require "graphviz"
