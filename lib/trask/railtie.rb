require "trask/helpers"

module Trask
  class Railtie < ::Rails::Railtie
   initializer "trask.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
