module ContinuusLenimentus
  class Runner
    attr_accessor :results

    def initialize
      self.results = {}
    end

    def self.rspec
      @rspec ||= Runner.new
    end
  end
end
