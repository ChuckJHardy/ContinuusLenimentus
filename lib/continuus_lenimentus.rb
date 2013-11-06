require "continuus_lenimentus/configuration"
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
    Save.this(Adapter.new(result).as_json).tap do |_|
      puts ContinuusLenimentus.configuration.message
    end
  end
end

class SimpleCov::Formatter::ContinuusLenimentusFormatter
  def format(result)
    ContinuusLenimentus.format(result)
    result
  end
end
