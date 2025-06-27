# frozen_string_literal: true

require_relative "lib/vietnam_scam_inspector/version"

Gem::Specification.new do |spec|
  spec.name          = "vietnam_scam_inspector"
  spec.version       = VietnamScamInspector::VERSION
  spec.authors       = ["Tran The Minh"]
  spec.email         = ["trantheminh25092003@gmail.com"]

  spec.summary       = "Gem kiểm tra số điện thoại, email hoặc tài khoản ngân hàng có nằm trong danh sách lừa đảo tại Việt Nam."
  spec.description   = "VietnamScamInspector giúp bạn dễ dàng kiểm tra xem một số điện thoại, email, hoặc tài khoản ngân hàng có trong danh sách lừa đảo ở Việt Nam không, từ dữ liệu cập nhật từ scam.vn hoặc người dùng đóng góp."
  spec.homepage      = "https://github.com/TranTheMinh09/vietnam_scam_inspector"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = "https://github.com/TranTheMinh09/vietnam_scam_inspector"
  spec.metadata["changelog_uri"]    = "https://github.com/TranTheMinh09/vietnam_scam_inspector/blob/main/CHANGELOG.md"

  # Tự động thêm file có trong Git repo (trừ các thư mục loại trừ)
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Development dependencies
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop", "~> 1.0"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
end
