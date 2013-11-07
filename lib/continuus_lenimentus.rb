require "continuus_lenimentus/configuration"
require "continuus_lenimentus/runner"
require "continuus_lenimentus/version"
require "continuus_lenimentus/safe"
require "continuus_lenimentus/adapter"
require "continuus_lenimentus/path"
require "continuus_lenimentus/save"

require "rspec/core/formatters/base_text_formatter"

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

class ContinuusLenimentusRspecFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def dump_summary(duration, example_count, failure_count, pending_count)
    ContinuusLenimentus::Runner.rspec.results = {
      duration: duration,
      counts: {
        example: example_count, 
        failure: failure_count, 
        pending: pending_count
      }
    }

    super(duration, example_count, failure_count, pending_count)
  end
end

class SimpleCov::Formatter::ContinuusLenimentusFormatter
  def format(result)
    ContinuusLenimentus.format(result)
    result
  end
end
