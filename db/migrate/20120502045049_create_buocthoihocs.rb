class CreateBuocthoihocs < ActiveRecord::Migration
  def self.up
    create_table :buocthoihocs do |t|
      t.column 'MaBTH', :string
      t.column 'TenBTH', :string
      t.column 'loaibuocthoihoc_id', :integer
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :buocthoihocs
  end
end
