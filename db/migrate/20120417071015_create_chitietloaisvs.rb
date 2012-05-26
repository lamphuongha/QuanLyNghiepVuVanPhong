class CreateChitietloaisvs < ActiveRecord::Migration
  def change
    create_table :chitietloaisvs do |t|
      t.column 'MaLoaiSv', :string
      t.column 'TenLoaict', :string
    end
  end
    def self.down
    drop_table :chitietloaisvs
  end
end
