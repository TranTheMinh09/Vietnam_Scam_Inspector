require "json"
require_relative "data_loader"

module VietnamScamInspector
  class Updater
    DATA_DIR = File.expand_path("../../data", __dir__)

    def self.add_entry(type:, value:, reason:, source:)
      file_path = File.join(DATA_DIR, "#{type}s.json")
      data = File.exist?(file_path) ? JSON.parse(File.read(file_path)) : []

      # Nếu chưa tồn tại, thêm vào
      unless data.any? { |entry| entry["value"] == value }
        data << {
          "value" => value,
          "reason" => reason,
          "source" => source
        }

        File.write(file_path, JSON.pretty_generate(data))
        return true
      end

      false
    end
  end
end
