module ContinuusLenimentus
  class Configuration
    attr_accessor :key, :file, :message

    def initialize
      self.key = 'wdPvuEFQiYgtTxhs97ZMCgpYfoQM'
      self.file = 'continuus_lenimentus.enc'
      self.message = "Continuous Integration report generated."
    end
  end
end
