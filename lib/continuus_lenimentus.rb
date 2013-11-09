require "continuus_lenimentus/configuration"
require "continuus_lenimentus/formatters"
require "continuus_lenimentus/runner"
require "continuus_lenimentus/version"
require "continuus_lenimentus/safe"
require "continuus_lenimentus/adapter"
require "continuus_lenimentus/path"
require "continuus_lenimentus/save"

module ContinuusLenimentus
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration
  end

  def self.format(result)
    Save.this(Adapter.new(result).as_user).tap do |_|
      puts ContinuusLenimentus.configuration.message
    end
  end
end

include ContinuusLenimentus::Formatters
