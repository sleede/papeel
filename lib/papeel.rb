require 'papeel/role'
require 'papeel/acts_as_papeel_user'
require 'papeel/acts_as_papeel_resource'

module Papeel
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield config
  end

  class Config
    attr_accessor :roles

    def initialize
      @roles = []
    end
  end
end
