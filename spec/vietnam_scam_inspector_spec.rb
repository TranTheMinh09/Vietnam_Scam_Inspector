RSpec.describe VietnamScamInspector do
  it "has a version number" do
    expect(VietnamScamInspector::VERSION).not_to be nil
  end

  it "responds to .check" do
    expect(VietnamScamInspector).to respond_to(:check)
  end
end
