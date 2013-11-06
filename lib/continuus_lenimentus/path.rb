module ContinuusLenimentus
  class Path
    def self.full
      new.full
    end

    def full
      File.join(directory, file)
    end

    private

    def file
      ContinuusLenimentus.configuration.file
    end

    def directory
      SimpleCov.coverage_path
    end
  end
end
