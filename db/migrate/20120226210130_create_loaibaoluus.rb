class CreateLoaibaoluus < ActiveRecord::Migration
  def self.up
    create_table :loaibaoluus do |t|
      t.column 'MaLoaiBaoLuu', :string
      t.column 'TenLoaiBaoLuu', :string
    end
    #create_table("loaibaoluus_sinhviens", :id=>false) do |t|
    #t.column 'loaibaoluu_id', :integer
    #t.column 'sinhvien_id', :integer
    #t.column 'ThoiGianBaoLuu', :string
    #t.column 'ThoiGianBatDau', :date
    #t.column 'ThoiGianKetThuc', :date
    #t.column 'LyDo', :string
    #t.column 'TrangThai', :boolean
    #end
    #Loaibaoluu.new do |loaibaoluu|
    #  loaibaoluu.MaLoaiBaoLuu = "All"
    #  Sinhvien.find(:all).each do |sinhvien|
    #    sinhvien.loaibaoluus << loaibaoluu
    #    sinhvien.save
    #  end
    #end
  end
  
  def self.down
    drop_table :loaibaoluus
    #drop_table :loaibaoluus_sinhviens
  end
end
