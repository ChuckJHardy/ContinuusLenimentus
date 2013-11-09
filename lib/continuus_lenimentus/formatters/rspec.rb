require "rspec/core/formatters/progress_formatter"

module ContinuusLenimentus::Formatters
  module Rspec
    class ContinuusLenimentusRspecFormatter < RSpec::Core::Formatters::ProgressFormatter
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
  end
end
