class CreateNgoaitrus < ActiveRecord::Migration
  def self.up
    create_table :ngoaitrus do |t|
      t.column 'MaNgoaiTru', :string
      t.column 'TenNgoaiTru', :string
      t.column 'loaingoaitru_id', :integer
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :ngoaitrus
  end
end
