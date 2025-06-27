require "spec_helper"
require "fileutils"
require_relative "../../lib/vietnam_scam_inspector/updater"
RSpec.describe VietnamScamInspector::Updater do
  let(:test_data_dir) { File.expand_path("../../tmp_test_data", __dir__) }
  let(:test_file_path) { File.join(test_data_dir, "phones.json") }

  before do
    # Tạo thư mục test
    FileUtils.mkdir_p(test_data_dir)

    # Ghi file phones.json rỗng
    File.write(test_file_path, [].to_json)

    # Monkey patch lại DATA_DIR để dùng thư mục test
    stub_const("VietnamScamInspector::Updater::DATA_DIR", test_data_dir)
  end

  after do
    FileUtils.rm_rf(test_data_dir) # dọn sau test
  end

  it "adds a new entry if not exists" do
    result = described_class.add_entry(
      type: :phone,
      value: "0999999999",
      reason: "Test lừa đảo",
      source: "rspec"
    )

    expect(result).to be true

    data = JSON.parse(File.read(test_file_path))
    expect(data.size).to eq(1)
    expect(data.first["value"]).to eq("0999999999")
  end

  it "does not add duplicate entry" do
    # Ghi sẵn một entry
    File.write(test_file_path, [
      { value: "0999999999", reason: "Test lừa đảo", source: "rspec" }
    ].to_json)

    result = described_class.add_entry(
      type: :phone,
      value: "0999999999",
      reason: "Duplicate",
      source: "rspec"
    )

    expect(result).to be false

    data = JSON.parse(File.read(test_file_path))
    expect(data.size).to eq(1)
  end
end
