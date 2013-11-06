require 'json'

module ContinuusLenimentus
  class Adapter
    def initialize(result)
      @result = result
    end

    def as_json
      as_hash.to_json
    end

    def as_hash
      {
        created_at: result.created_at,
        command_name: result.command_name,
        metrics: metrics
      }
    end

    private
    attr_reader :result

    def metrics
      {
        total_lines: result.total_lines,
        coverage: coverage
      }
    end

    def coverage
      {
        percent: result.covered_percent,
        strength: strength,
        lines: result.covered_lines,
      }
    end

    def strength
      result.covered_strength.nan? ? 0.0 : result.covered_strength
    end
  end
end
