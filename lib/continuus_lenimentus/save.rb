module ContinuusLenimentus
  class Save
    def initialize(data)
      @data = data
    end

    def self.this(data)
      new(data).writer
    end

    def writer
      File.open(path, mode) { |file| file.puts Safe.encrypt(@data) }
    end

    private

    def mode
      'w+'
    end

    def path
      Path.full
    end
  end
end

