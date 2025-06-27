require "spec_helper"

RSpec.describe VietnamScamInspector::Checker do
  describe ".check" do
    context "when phone number is in scam list" do
      it "returns scam: true with reason and source" do
        result = described_class.check("0976123456")

        expect(result[:scam]).to be true
        expect(result[:type]).to eq(:phone)
        expect(result[:reason]).to include("Lừa đảo")
        expect(result[:source]).to eq("scam.vn")
      end
    end

    context "when phone number is not in scam list" do
      it "returns scam: false" do
        result = described_class.check("0912345678")

        expect(result[:scam]).to be false
        expect(result[:type]).to eq(:phone)
      end
    end
  end

  describe ".detect_type" do
    it "returns :phone for 10-digit number" do
      expect(described_class.detect_type("0912345678")).to eq(:phone)
    end

    it "returns :email for email address" do
      expect(described_class.detect_type("abc@example.com")).to eq(:email)
    end

    it "returns :bank_account for long numeric" do
      expect(described_class.detect_type("12345678901234")).to eq(:bank_account)
    end

    it "returns :unknown for invalid input" do
      expect(described_class.detect_type("!@#{$$}%")).to eq(:unknown)
    end
  end
end
