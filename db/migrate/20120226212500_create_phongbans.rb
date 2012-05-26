class CreatePhongbans < ActiveRecord::Migration
  def self.up
    create_table :phongbans do |t|
      t.column 'MaPB', :string
      t.column 'TenPB', :string
    end
  end
  def self.down
    drop_table :phongbans
  end
end
