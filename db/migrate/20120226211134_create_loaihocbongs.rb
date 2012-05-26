class CreateLoaihocbongs < ActiveRecord::Migration
  def self.up
    create_table :loaihocbongs do |t|
      t.column 'MaLoaiHocBong', :string
      t.column 'TenLoaiHocBong', :string
      
      
    end
    #create_table("loaihocbongs_sinhviens", :id=>false) do |t|
    #t.column 'loaihocbong_id', :integer
    #t.column 'sinhvien_id', :integer
    #t.column 'HocKy', :integer
    #t.column 'NamHoc', :integer
    #t.column 'GhiChu', :string
    
    #end
    #Loaihocbong.new do |loaihocbong|
    #  loaihocbong.MaLoaiHocBong = "All"
    #  Sinhvien.find(:all).each do |sinhvien|
    #    sinhvien.loaihocbongs << loaihocbong
    #    sinhvien.save
    #  end
    #end
  end
  def self.down
    drop_table :loaihocbongs
    #drop_table :loaihocbongs_sinhviens
  end
end
