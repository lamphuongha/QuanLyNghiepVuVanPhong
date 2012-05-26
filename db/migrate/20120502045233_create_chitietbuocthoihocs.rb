class CreateChitietbuocthoihocs < ActiveRecord::Migration
  def self.up
    create_table :chitietbuocthoihocs do |t|
      t.column 'sinhvien_id', :integer
      t.column 'buocthoihoc_id', :integer
    end
  end
  def self.down
    drop_table :chitietbuocthoihocs
  end
end
