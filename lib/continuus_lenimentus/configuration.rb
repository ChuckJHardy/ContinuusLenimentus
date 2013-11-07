module ContinuusLenimentus
  class Configuration
    attr_accessor :rspec, :encrypted, :key, :file, :directory, :message

    def initialize
      self.encrypted = true
      self.key = 'wdPvuEFQiYgtTxhs97ZMCgpYfoQM'
      self.file = 'continuus_lenimentus.enc'
      self.directory = SimpleCov.coverage_path
      self.message = "Continuous Integration report generated."
    end
  end
end
