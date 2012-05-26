class CreateLoaithuctaps < ActiveRecord::Migration
  def self.up
    create_table :loaithuctaps do |t|
      t.column "MaLoaiThucTap", :string
      t.column "TenLoaiThucTap", :string
    end
  end
  def self.down
    drop_table :loaithuctaps
  end
end
