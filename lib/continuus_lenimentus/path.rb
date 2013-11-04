module ContinuusLenimentus
  class Path
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
