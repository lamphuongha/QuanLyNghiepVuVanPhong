# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120604131036) do

  create_table "assets", :force => true do |t|
    t.integer  "congvan_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "baoluus", :force => true do |t|
    t.string  "MaBaoLuu"
    t.string  "TenBaoLuu"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "buocthoihocs", :force => true do |t|
    t.string  "MaBTH"
    t.string  "TenBTH"
    t.integer "loaibuocthoihoc_id"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "chitietbaoluus", :force => true do |t|
    t.string "sinhvien_id"
    t.string "baoluu_id"
  end

  create_table "chitietbuocthoihocs", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "buocthoihoc_id"
  end

  create_table "chitietdiemrenluyens", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "diemrenluyen_id"
    t.integer "Diem"
    t.string  "XepLoai"
    t.string  "GhiChu"
  end

  create_table "chitiethocbongs", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "hocbong_id"
  end

  create_table "chitietloaisvs", :force => true do |t|
    t.string "MaLoaiSv"
    t.string "TenLoaict"
  end

  create_table "chitietngoaitrus", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "ngoaitru_id"
  end

  create_table "chitietnoitrus", :force => true do |t|
    t.integer "noitru_id"
    t.integer "sinhvien_id"
  end

  create_table "chitiettrocaps", :force => true do |t|
    t.integer "trocap_id"
    t.integer "sinhvien_id"
  end

  create_table "chucvus", :force => true do |t|
    t.string "MaCV"
    t.string "TenCV"
  end

  create_table "congvans", :force => true do |t|
    t.string  "SoCV"
    t.date    "NgayRaCV"
    t.date    "NgayNhanCV"
    t.string  "NoiDungCV"
    t.string  "TacGia"
    t.string  "NguoiNhan"
    t.string  "HinhAnhCV"
    t.integer "loaicv_id"
    t.integer "NoiGui"
    t.integer "NoiNhan"
    t.integer "nhomloaicv_id"
    t.string  "GhiChu"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "image_file_name"
    t.string  "image_content_type"
    t.integer "image_file_size"
  end

  create_table "congvans_nhomcvs", :force => true do |t|
    t.integer "congvan_id"
    t.integer "nhomcv_id"
    t.string  "GhiChu"
  end

  create_table "covanhoctaps", :force => true do |t|
    t.integer "giangvien_id"
    t.integer "lop_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "diemrenluyens", :force => true do |t|
    t.string  "MaDRL"
    t.string  "TenDRL"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "giangviens", :force => true do |t|
    t.string  "MaGV"
    t.string  "HoTenGV"
    t.string  "DiaChiGV"
    t.string  "SDTGV"
    t.string  "chucvu_id"
    t.integer "hocvi_id"
    t.string  "Hocham"
    t.string  "ngach_id"
    t.integer "lop_id"
    t.integer "giangvien_id"
    t.string  "GhiChu"
  end

  create_table "hocbongs", :force => true do |t|
    t.string  "MaHocBong"
    t.string  "TenHocBong"
    t.integer "loaihocbong_id"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.date    "NgayLap"
    t.string  "GhiChu"
    t.string  "NoiCap",         :limit => 100
  end

  create_table "hocvis", :force => true do |t|
    t.string "MaHocVi"
    t.string "TenHocVi"
  end

  create_table "loaibaoluus", :force => true do |t|
    t.string "MaLoaiBaoLuu"
    t.string "TenLoaiBaoLuu"
  end

  create_table "loaibuocthoihocs", :force => true do |t|
    t.string "MaLoaiBTH"
    t.string "TenLoaiBTH"
  end

  create_table "loaicvs", :force => true do |t|
    t.string "MaLoaiCV"
    t.string "TenLoaiCV"
  end

  create_table "loaihocbongs", :force => true do |t|
    t.string "MaLoaiHocBong"
    t.string "TenLoaiHocBong"
  end

  create_table "loaingoaitrus", :force => true do |t|
    t.string "MaLoaiNgoaiTru"
    t.string "TenLoaiNgoaiTru"
  end

  create_table "loaisinhviens", :force => true do |t|
    t.string "MaLoaiSv"
    t.string "TenLoaiSv"
  end

  create_table "loaithuctaps", :force => true do |t|
    t.string "MaLoaiThucTap"
    t.string "TenLoaiThucTap"
  end

  create_table "loaitrocaps", :force => true do |t|
    t.string "MaLoaiTroCap"
    t.string "TenLoaiTroCap"
  end

  create_table "lops", :force => true do |t|
    t.string "MaLop"
    t.string "TenLop"
  end

  create_table "ngaches", :force => true do |t|
    t.string "MaNgach"
    t.string "TenNgach"
  end

  create_table "ngoaitrus", :force => true do |t|
    t.string  "MaNgoaiTru"
    t.string  "TenNgoaiTru"
    t.integer "loaingoaitru_id"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "nguoilienquans", :force => true do |t|
    t.integer "congvan_id"
    t.integer "giangvien_id"
  end

  create_table "nhomcvs", :force => true do |t|
    t.string "MaNhomCV"
    t.string "TenNhomCV"
    t.string "GhiChu"
  end

  create_table "nhomloaicvs", :force => true do |t|
    t.string "MaNhomLoaiCV"
    t.string "TenNhomLoaiCV"
  end

  create_table "noitrus", :force => true do |t|
    t.string  "MaNoiTru"
    t.string  "TenNoiTru"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "phongbans", :force => true do |t|
    t.string "MaPB"
    t.string "TenPB"
  end

  create_table "roles", :force => true do |t|
    t.string "MaRole"
    t.string "TenRole"
  end

  create_table "sinhviens", :force => true do |t|
    t.string  "MSSV"
    t.string  "HoTenSV"
    t.date    "NgaySinh"
    t.string  "GioiTinh"
    t.string  "DiaChi"
    t.string  "SDT"
    t.integer "lop_id"
    t.integer "trinhdodaotao_id"
    t.integer "loaithuctap_id"
    t.string  "TenCongTy"
    t.string  "DiaChiCT"
    t.string  "SDTCT"
    t.integer "HocKyTT"
    t.string  "NamHocTT"
  end

  create_table "thongtinthuctaps", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "loaithuctap_id"
    t.string  "TenCongTy"
    t.string  "DiaChi"
    t.string  "SDT"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "trinhdodaotaos", :force => true do |t|
    t.string "MaTDDT"
    t.string "TenTDDT"
  end

  create_table "trocaps", :force => true do |t|
    t.string  "MaTroCap"
    t.string  "TenTroCap"
    t.integer "loaitrocap_id"
    t.integer "congvan_id"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "ttthuctaps", :force => true do |t|
    t.integer "sinhvien_id"
    t.integer "loaithuctap_id"
    t.string  "TenCongTy"
    t.string  "DiaChi"
    t.string  "SDT"
    t.integer "HocKy"
    t.string  "NamHoc"
    t.string  "GhiChu"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "giangvien_id"
    t.integer  "role_id",                :default => 3
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
