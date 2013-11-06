require "continuus_lenimentus/configuration"
require "continuus_lenimentus/version"
require "continuus_lenimentus/safe"
require "continuus_lenimentus/adapter"
require "continuus_lenimentus/path"

module ContinuusLenimentus
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration
  end

  class SimpleCov::Formatter::ContinuusLenimentus
    def format(result)
    end
  end
end
