class CreateNguoilienquans < ActiveRecord::Migration
  def self.up
    create_table :nguoilienquans do |t|
      t.column 'congvan_id', :integer
      t.column 'giangvien_id', :integer
      
    end
  end
  def self.down
    drop_table :nguoilienquans
  end
end
