class CreateLoaitrocaps < ActiveRecord::Migration
  def self.up
    create_table :loaitrocaps do |t|
      t.column 'MaLoaiTroCap', :string
      t.column 'TenLoaiTroCap', :string
    end
    #create_table("loaitrocaps_sinhviens", :id=>false) do |t|
    #t.column 'loaitrocap_id', :integer
    #t.column 'sinhvien_id', :integer
    #t.column 'HocKy', :integer
    #t.column 'NamHoc', :integer
    #t.column 'GhiChu', :string
    
    #end
    #Loaitrocap.new do |loaitrocap|
    #  loaitrocap.MaLoaiTroCap = "All"
    #  Sinhvien.find(:all).each do |sinhvien|
    #    sinhvien.loaitrocaps << loaitrocap
    #    sinhvien.save
    #  end
    #end
  end
  def self.down
    drop_table :loaitrocaps
    #drop_table :loaitrocaps_sinhviens
  end
end
