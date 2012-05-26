class CreateLoaingoaitrus < ActiveRecord::Migration
  def self.up
    create_table :loaingoaitrus do |t|
      t.column 'MaLoaiNgoaiTru', :string
      t.column 'TenLoaiNgoaiTru', :string
      
    end
  end
  def self.down
    drop_table :loaingoaitrus
  end
end
