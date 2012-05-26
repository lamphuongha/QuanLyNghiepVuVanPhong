class CreateLoaibuocthoihocs < ActiveRecord::Migration
  def self.up
    create_table :loaibuocthoihocs do |t|
      t.column 'MaLoaiBTH', :string
      t.column 'TenLoaiBTH', :string
    end
    #create_table("loaibuocthoihocs_sinhviens", :id=>false) do |t|
    #t.column 'loaibuocthoihoc_id', :integer
    #t.column 'sinhvien_id', :integer
    #t.column 'HocKy', :integer
    #t.column 'NamHoc', :integer
    #t.column 'GhiChu', :string
    
    #end
    #Loaibuocthoihoc.new do |loaibuocthoihoc|
    #  loaibuocthoihoc.MaLoaiBTH = "All"
    #  Sinhvien.find(:all).each do |sinhvien|
    #    sinhvien.loaibuocthoihocs << loaibuocthoihoc
    #    sinhvien.save
    #  end
    #end
  end
  def self.down
    drop_table :loaibuocthoihocs
    #drop_table :loaibuocthoihocs_sinhviens
  end
end
