class CreateNhomcvs < ActiveRecord::Migration
  def self.up
    create_table :nhomcvs do |t|
      t.column 'MaNhomCV', :string
      t.column 'TenNhomCV', :string
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :nhomcvs
  end
end
