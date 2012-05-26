class CreateHocbongs < ActiveRecord::Migration
  def self.up
    create_table :hocbongs do |t|
      t.column "MaHocBong", :string
      t.column "TenHocBong", :string
      t.column "loaihocbong_id", :integer
      t.column "congvan_id", :integer
      t.column "NoiCap", :string
      t.column "HocKy", :integer
      t.column "NamHoc", :string
      t.column "NgayLap", :date
      t.column "GhiChu", :string
    end
  end
  def self.down
    drop_table :hocbongs
  end
end
