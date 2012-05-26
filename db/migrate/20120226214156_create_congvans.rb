class CreateCongvans < ActiveRecord::Migration
  def self.up
    create_table :congvans do |t|
      t.column :SoCV, :string
      t.column 'NgayRaCV', :date
      t.column 'NgayNhanCV', :date
      t.column 'NoiDungCV', :string
      t.column 'TacGia', :string
      t.column 'NguoiNhan', :string
      t.column 'HinhAnhCV', :string
      t.column 'loaicv_id', :integer
      t.column 'NoiGui', :integer
      t.column 'NoiNhan', :integer
      t.column 'nhomloaicv_id', :integer
      t.column 'GhiChu', :string
      t.column 'HocKy', :integer
      t.column 'NamHoc', :string
    end
    #create_table("congvans_phongbans", :id=>false) do |t|
    #t.column 'congvan_id', :integer
    #t.column 'phongban_id', :integer
    #t.column 'HocKy', :integer
    #t.column 'NamHoc', :string
    #t.column 'NhomLoaiCV', :boolean
    #t.column 'GhiChu', :string
    
    #end
    #Congvan.new do |congvan|
    #  congvan.SoCV = "All"
    #  Phongban.find(:all).each do |phongban|
    #    phongban.congvans << congvan
    #    phongban.save
    #  end
    #end
    
    #create_table("congvans_nhomcvs", :id=>false) do |t|
    #t.column 'congvan_id', :integer
    #t.column 'nhomcv_id', :integer
    #t.column 'GhiChu', :string
    
    #end
    #Congvan.new do |congvan|
    #  congvan.SoCV = "All"
    #  Nhomcv.find(:all).each do |nhomcv|
    #    nhomcv.congvans << congvan
    #    nhomcv.save
    #  end
    #end
  end
  def self.down
    drop_table :congvans
    drop_table :congvans_phongbans
    drop_table :congvans_nhomcvs
  end
end
