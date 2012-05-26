class CreateChitiethocbongs < ActiveRecord::Migration
  def self.up
    create_table :chitiethocbongs do |t|
      t.column 'sinhvien_id', :integer
      t.column 'hocbong_id', :integer

    end
  end
  def self.down
    drop_table :chitiethocbongs
  end
end
