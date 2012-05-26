class CreateLoaicvs < ActiveRecord::Migration
  def self.up
    create_table :loaicvs do |t|
      t.column 'MaLoaiCV', :string
      t.column 'TenLoaiCV', :string
    end
  end
  def self.down
    drop_table :loaicvs
  end
end