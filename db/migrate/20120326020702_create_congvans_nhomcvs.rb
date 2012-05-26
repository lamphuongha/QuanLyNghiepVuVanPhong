class CreateCongvansNhomcvs < ActiveRecord::Migration
  def self.up
    create_table :congvans_nhomcvs do |t|
      t.column 'congvan_id', :integer
      t.column 'nhomcv_id', :integer
      t.column 'GhiChu', :string
    end
  end
  def self.down
    drop_table :congvans_nhomcvs
  end
end
