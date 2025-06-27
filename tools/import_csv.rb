# tools/import_csv.rb
require "csv"
require_relative "../lib/vietnam_scam_inspector"

type = ARGV[0] # :phone, :email, :bank_account
file = ARGV[1]

unless %w[phone email bank_account].include?(type) && File.exist?(file)
  puts "❌ Cách dùng: ruby tools/import_csv.rb [phone|email|bank_account] [tệp_csv]"
  exit
end

count = 0

CSV.foreach(file, headers: true) do |row|
  added = VietnamScamInspector::Updater.add_entry(
    type: type.to_sym,
    value: row["value"],
    reason: row["reason"],
    source: row["source"]
  )

  count += 1 if added
end

puts "✅ Đã nhập xong: #{count} bản ghi"
