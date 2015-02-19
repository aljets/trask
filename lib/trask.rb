require "trask/version"
require "trask/engine"
require "trask/railtie"

module Trask
  # Your code goes here...
  #


  ## Configuration
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :base_model

    def initialize
      @base_model = Trask::Page
    end
  end

end
