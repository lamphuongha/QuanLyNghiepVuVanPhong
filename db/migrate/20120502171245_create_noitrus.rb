class CreateNoitrus < ActiveRecord::Migration
  def self.up
    create_table :noitrus do |t|
      t.column 'MaNoiTru', :string
      t.column 'TenNoiTru', :string
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :noitrus
  end
end
