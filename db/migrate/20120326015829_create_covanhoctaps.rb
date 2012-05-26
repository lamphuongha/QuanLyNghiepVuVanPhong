class CreateCovanhoctaps < ActiveRecord::Migration
  def self.up
    create_table :covanhoctaps do |t|
      t.column 'giangvien_id', :integer
      t.column 'lop_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :covanhoctaps
  end
end
