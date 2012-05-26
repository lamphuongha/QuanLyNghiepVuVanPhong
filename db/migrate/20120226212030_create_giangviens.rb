class CreateGiangviens < ActiveRecord::Migration
  def self.up
    create_table :giangviens do |t|
      t.column 'MaGV', :string
      t.column 'HoTenGV', :string
      t.column 'DiaChiGV', :string
      t.column 'SDTGV', :string
      t.column 'chucvu_id', :string
      t.column 'hocvi_id', :integer
      t.column 'Hocham', :string
      t.column 'ngach_id', :string
      t.column 'lop_id', :integer
      t.column 'giangvien_id', :integer
      t.column 'GhiChu', :string

      
    end
    #create_table("giangviens_lops", :id=>false) do |t|
    #t.column 'giangvien_id', :integer
    #t.column 'lop_id', :integer
    #t.column 'HocKy', :integer
    #t.column 'NamHoc', :integer
    #t.column 'GhiChu', :string
    
    #end
    #Giangvien.new do |giangvien|
    #  giangvien.MaGV = "All"
    #  Lop.find(:all).each do |lop|
    #    lop.giangviens << giangvien
    #    lop.save
    #  end
    #end
  end
  def self.down
    drop_table :giangviens
    #drop_table :giangviens_lops
  end
end
