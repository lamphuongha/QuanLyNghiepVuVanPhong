class CreateSinhviens < ActiveRecord::Migration
  def self.up
    create_table :sinhviens do |t|
      t.column 'MSSV', :string
      t.column 'HoTenSV', :string
      t.column 'NgaySinh', :date
      t.column 'GioiTinh', :string
      t.column 'DiaChi', :string
      t.column 'SDT', :string
      t.column 'lop_id', :integer    
      t.column 'trinhdodaotao_id', :integer
    end
  end
  def self.down
    drop_table :sinhviens
  end
end
