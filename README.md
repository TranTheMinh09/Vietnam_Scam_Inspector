# 🇻🇳 VietnamScamInspector

**VietnamScamInspector** là một Ruby gem giúp kiểm tra **số điện thoại**, **email**, hoặc **tài khoản ngân hàng** có nằm trong **danh sách nghi ngờ lừa đảo** tại Việt Nam hay không.

> 📌 Dữ liệu do người dùng và tổ chức nội bộ đóng góp, được kiểm duyệt trước khi đưa vào hệ thống. Không dựa vào nguồn không xác minh.

---

## 📦 Cài đặt

Thêm vào `Gemfile` nếu dùng Bundler:

```ruby
gem 'vietnam_scam_inspector'
```

Hoặc cài thủ công:

```bash
gem install vietnam_scam_inspector
```

---

## 🚀 Cách sử dụng

### ✅ Dùng trong mã Ruby:

```ruby
require "vietnam_scam_inspector"

result = VietnamScamInspector.check("0976123456")

if result[:scam]
  puts "🚨 Lừa đảo: #{result[:reason]} (Nguồn: #{result[:source]})"
else
  puts "✅ Không có dấu hiệu lừa đảo"
end
```

### 💻 Dùng qua dòng lệnh:

```bash
scam-check 0976123456
```

Kết quả:

```bash
🚨 LỪA ĐẢO: 0976123456
→ Lý do: Giả danh công an
→ Nguồn: CSKH
```

---

## 🧠 Hệ thống tự nhận diện

| Đầu vào ví dụ       | Hệ thống hiểu là       |
| ------------------- | ---------------------- |
| `0976123456`        | 📱 Số điện thoại       |
| `scam@fakebank.com` | 📧 Email               |
| `123456789012`      | 🏦 Tài khoản ngân hàng |

---

## ✏️ Cập nhật dữ liệu

Bạn có thể thêm dữ liệu mới (nếu chưa tồn tại) bằng mã Ruby:

```ruby
VietnamScamInspector::Updater.add_entry(
  type: :phone,
  value: "0909123456",
  reason: "Giả danh tuyển dụng",
  source: "admin_report"
)
```

> Có thể thay `:phone` bằng `:email` hoặc `:bank_account`.

---

## 🧪 Kiểm thử

Chạy tất cả kiểm thử:

```bash
bundle exec rspec
```

---

## 📁 Dữ liệu

Dữ liệu được lưu dưới dạng JSON trong thư mục `data/`, bao gồm:

- `phones.json`
- `emails.json`
- `bank_accounts.json`

> ⚠️ Dữ liệu là nội bộ, được duyệt trước khi sử dụng. Không sử dụng dữ liệu chưa xác minh hoặc từ nguồn không rõ ràng.

---

## 📄 Giấy phép

MIT License – Tự do sử dụng, chỉnh sửa, chia sẻ.

---

## ✨ Tác giả

- **Tran The Minh**
- GitHub: [https://github.com/TranTheMinh09](https://github.com/TranTheMinh09)

---

## 🤝 Đóng góp

Pull request luôn được chào đón.  
Nếu bạn muốn đóng góp thêm dữ liệu hoặc ý tưởng, hãy tạo issue hoặc liên hệ tác giả.
