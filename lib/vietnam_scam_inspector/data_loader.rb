require "json"

module VietnamScamInspector
  class DataLoader
    DATA_DIR = File.expand_path("../../data", __dir__)

    def self.load_data(type)
      file_path = File.join(DATA_DIR, "#{type}s.json")
      return [] unless File.exist?(file_path)

      JSON.parse(File.read(file_path))
    end

    def self.sources
      Dir[File.join(DATA_DIR, "*.json")].map do |file|
        File.basename(file)
      end
    end
  end
end
