class CreateLops < ActiveRecord::Migration
  def self.up
    create_table :lops do |t|
      t.column 'MaLop', :string
      t.column 'TenLop', :string
      
    end
  end
  def self.down
    drop_table :lops
  end
end
