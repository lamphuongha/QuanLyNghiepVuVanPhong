class CreateThongtinthuctaps < ActiveRecord::Migration
  def self.up
    create_table :thongtinthuctaps do |t|
      t.column "sinhvien_id", :integer
      t.column "loaithuctap_id", :integer
      
      t.column "TenCongTy", :string
      t.column "DiaChi", :string
      t.column "SDT", :string
      t.column "HocKy", :integer
      t.column "NamHoc", :string
      t.column "GhiChu", :string
    end
  end
  def self.down
    drop_table :thongtinthuctaps
  end
end
