# frozen_string_literal: true

require_relative "vietnam_scam_inspector/version"
require_relative "vietnam_scam_inspector/checker"
require_relative "vietnam_scam_inspector/data_loader"
require_relative "vietnam_scam_inspector/updater"

module VietnamScamInspector
  class << self
    # Public API để người dùng gọi
    def check(input)
      Checker.check(input)
    end

    def data_sources
      DataLoader.sources
    end
  end
end
