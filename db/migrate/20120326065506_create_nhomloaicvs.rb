class CreateNhomloaicvs < ActiveRecord::Migration
  def self.up
    create_table :nhomloaicvs do |t|
      t.column "MaNhomLoaiCV", :string
      t.column "TenNhomLoaiCV", :string
    end
  end
  def self.down
    drop_table :nhomloaicvs
  end
end
