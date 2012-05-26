class CreateDiemrenluyens < ActiveRecord::Migration
  def self.up
    create_table :diemrenluyens do |t|
      t.column 'MaDRL', :string
      t.column 'TenDRL', :string
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :diemrenluyens
  end
end
