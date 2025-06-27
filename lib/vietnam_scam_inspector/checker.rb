module VietnamScamInspector
  class Checker
    def self.check(input)
      type = detect_type(input)
      return { scam: false, type: :unknown } if type == :unknown

      data = DataLoader.load_data(type)
      scam_info = data.find { |entry| entry["value"] == input }

      if scam_info
        {
          scam: true,
          type: type,
          reason: scam_info["reason"],
          source: scam_info["source"]
        }
      else
        {
          scam: false,
          type: type
        }
      end
    end

    def self.detect_type(input)
      if input.match?(/\A\d{9,11}\z/)
        :phone
      elsif input.match?(/\A[^@\s]+@[^@\s]+\.[^@\s]+\z/)
        :email
      elsif input.match?(/\A\d{8,16}\z/)
        :bank_account
      else
        :unknown
      end
    end
  end
end
