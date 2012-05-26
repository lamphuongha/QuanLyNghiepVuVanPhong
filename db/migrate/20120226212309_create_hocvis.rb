class CreateHocvis < ActiveRecord::Migration
  def self.up
    create_table :hocvis do |t|
      t.column 'MaHocVi', :string
      t.column 'TenHocVi', :string
      
    end
  end
  def self.down
    drop_table :hocvis
  end
end
