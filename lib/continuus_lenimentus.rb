require "continuus_lenimentus/configuration"
require "continuus_lenimentus/version"

module ContinuusLenimentus
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration
  end
end
