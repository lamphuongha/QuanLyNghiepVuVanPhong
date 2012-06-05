class Giangvien < ActiveRecord::Base
  belongs_to :hocvi
  belongs_to :chucvu
  belongs_to :ngach
  has_one :user
  #has_and_belongs_to_many :lops
  has_many :covanhoctaps
  has_many :lops, :through => :covanhoctaps
  has_many :users
  
  has_many :nguoilienquans
  has_many :congvans, :through => :nguoilienquans 
  
 validates_presence_of :MaGV, :HoTenGV, :DiaChiGV, :SDTGV, :chucvu_id,:hocvi_id,:Hocham,:ngach_id, :message => "không được trống"
 validates_uniqueness_of :MaGV, :message => "đã tồn tại"
 
  cattr_reader :per_page
  @@per_page = 20
  
 def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "/app/assets/images/cvimages"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
 # def self.search(search)
#  search_condition = "%" + search + "%"
#  find(:all, :conditions => ['HoTenGV LIKE ? OR MaGV LIKE ?', search_condition, search_condition])
#end

  def self.search(search)  
    if search  
      where('MaGV LIKE ?  or HoTenGV LIKE ? or SDTGV = ? or TenCV = ? or TenHocVi = ? or TenNgach = ?', "%#{search}%","%#{search}%", "#{search}","#{search}", "#{search}","#{search}")  
    else
      scoped  
    end  
  end 
 
  def self.build_query(sMaGV,sHoTenGV,sDiaChiGV,sSDTGV,schucvu_id,shocvi_id,sngach_id,sHocham)
    term_portion=''
    term_portion='(MaGV like :MaGV) AND ' unless sMaGV.blank?
    hoten_portion = ' (HoTenGV like :HoTenGV) AND ' unless sHoTenGV.blank?
    diachi_portion = ' (DiaChiGV like :DiaChiGV) AND ' unless sDiaChiGV.blank?
    sdt_portion = ' (SDTGV=:SDTGV) AND ' unless sSDTGV.blank?
    chucvu_portion = ' (chucvu_id=:chucvu_id) AND ' unless schucvu_id.blank?
    hocvi_portion = ' (hocvi_id=:hocvi_id) AND ' unless shocvi_id.blank?
    ngach_portion = ' (ngach_id=:ngach_id) AND ' unless sngach_id.blank?
    hocham_portion = ' (Hocham like :Hocham) AND ' unless sHocham.blank?
    
    search_str='%s %s %s %s %s %s %s %s ' % [term_portion, hoten_portion, diachi_portion, sdt_portion, chucvu_portion, hocvi_portion, 
      ngach_portion, hocham_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaGV,sHoTenGV,sDiaChiGV,sSDTGV,schucvu_id,shocvi_id,sngach_id,sHocham)  
      filter_str=build_query(sMaGV,sHoTenGV,sDiaChiGV,sSDTGV,schucvu_id,shocvi_id,sngach_id,sHocham)
    Giangvien.includes(:chucvu, :hocvi, :ngach).where([filter_str,
                {:MaGV=>"%#{sMaGV}%",
                  :HoTenGV=>"%#{sHoTenGV}%",
                  :DiaChiGV=>"%#{sDiaChiGV}%",
                  :SDTGV=>"#{sSDTGV}",
                  :chucvu_id=>"#{schucvu_id}",
                  :hocvi_id=>"#{shocvi_id}",
                  :ngach_id=>"#{sngach_id}",
                  :Hocham=>"%#{sHocham}%",
                }])
  end
end
