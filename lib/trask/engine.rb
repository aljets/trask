require 'trask/controller_helpers'

module Trask
  class Engine < ::Rails::Engine
    isolate_namespace Trask

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( )
    end

    initializer 'trask.action_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        include Trask::ControllerHelpers
      end
    end
  end
end
