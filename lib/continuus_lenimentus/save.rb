module ContinuusLenimentus
  class Save
    def initialize(data)
      @data = data
    end

    def self.this(data)
      new(data).writer
    end

    def writer
      File.open(path, mode) { |file| file.puts data }
    end

    private

    def data
      encrypt? ? Safe.encrypt(@data) : @data 
    end

    def mode
      'w+'
    end

    def path
      Path.full
    end

    def encrypt?
      ContinuusLenimentus.configuration.encrypted
    end
  end
end

