class CreateChitietnoitrus < ActiveRecord::Migration
  def self.up
    create_table :chitietnoitrus do |t|
      t.column 'noitru_id', :integer
      t.column 'sinhvien_id', :integer
      
    end
  end
  def self.down
    drop_table :chitietnoitrus
  end
end
