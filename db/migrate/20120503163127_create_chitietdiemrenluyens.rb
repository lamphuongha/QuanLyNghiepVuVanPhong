class CreateChitietdiemrenluyens < ActiveRecord::Migration
  def self.up
    create_table :chitietdiemrenluyens do |t|
      t.column 'sinhvien_id', :integer
      t.column 'diemrenluyen_id', :integer
      t.column 'Diem', :integer
      t.column 'XepLoai', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :chitietdiemrenluyens
  end
end
