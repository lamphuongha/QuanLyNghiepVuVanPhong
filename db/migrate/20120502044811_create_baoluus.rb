class CreateBaoluus < ActiveRecord::Migration
  def self.up
    create_table :baoluus do |t|
      t.column 'MaBaoLuu', :string
      t.column 'TenBaoLuu', :string
      t.column 'congvan_id', :integer
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :baoluus
  end
end
