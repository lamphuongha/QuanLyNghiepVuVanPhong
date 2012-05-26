class CreateChitietngoaitrus < ActiveRecord::Migration
  def self.up
    create_table :chitietngoaitrus do |t|
      t.column 'sinhvien_id', :integer
      t.column 'ngoaitru_id', :integer

    end
  end
  def self.down
    drop_table :chitietngoaitrus
  end
end
