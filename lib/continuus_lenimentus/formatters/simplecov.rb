module ContinuusLenimentus::Formatters
  module Simplecov
    class SimpleCov::Formatter::ContinuusLenimentusFormatter
      def format(result)
        ContinuusLenimentus.format(result)
        result
      end
    end
  end
end
