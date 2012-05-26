class Sinhvien < ActiveRecord::Base
  belongs_to :lop
  belongs_to :trinhdodaotao
  has_one :thongtinthuctap
  #has_and_belongs_to_many :loaibaoluus
  #has_and_belongs_to_many :loaibuocthoihocs
  #has_and_belongs_to_many :loaihocbongs
  #has_and_belongs_to_many :loaithuongtrus
  #has_and_belongs_to_many :loaitrocaps
  has_many :chitiethocbongs
  has_many :hocbongs, :through => :chitiethocbongs
  has_many :chitietbaoluus
  has_many :baoluus, :through => :chitietbaoluus
  has_many :chitietbuocthoihocs
  has_many :buocthoihocs, :through => :chitietbuocthoihocs
  #has_many :chitietthuongtrus
  #has_many :thuongtrus, :through => :chitietthuongtrus
  has_many :chitietngoaitrus
  has_many :ngoaitrus, :through => :chitietngoaitrus
  has_many :chitietnoitrus
  has_many :noitrus, :through => :chitietnoitrus
  has_many :chitiettrocaps
  has_many :trocaps, :through => :chitiettrocaps
  has_many :chitietdiemrenluyens
  has_many :diemrenluyens, :through => :chitietdiemrenluyens
  #accepts_nested_attributes_for :chitietdiemrenluyens
  
 validates_presence_of :MSSV, :HoTenSV, :NgaySinh, :GioiTinh, :DiaChi, :lop_id,:trinhdodaotao_id
 validates_uniqueness_of :MSSV
  cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MSSV = ? or HoTenSV LIKE ? or NgaySinh = ? or DiaChi LIKE ? or SDT = ? or TenLop = ? or GioiTinh = ?
      ', "#{search}","%#{search}%","#{search}","%#{search}%", "#{search}","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
 
  def self.build_query(sMSSV,sHoTen,sDiaChi,sSDT,slop_id,sNgaySinh,strinhdodaotao_id,sGioiTinh)
    term_portion=''
    term_portion='(MSSV like :MSSV) AND ' unless sMSSV.blank?
    hoten_portion = ' (HoTenSV LIKE :HoTenSV) AND ' unless sHoTen.blank?
    diachi_portion = ' (DiaChi LIKE :DiaChi) AND ' unless sDiaChi.blank?
    sdt_portion = ' (SDT =:SDT) AND ' unless sSDT.blank?
    lop_id_portion = ' (lop_id=:lop_id) AND ' unless slop_id.blank?
    ngaysinh_portion = ' (NgaySinh = :NgaySinh) AND ' unless sNgaySinh.blank?
    trinhdodaotao_portion = ' (trinhdodaotao_id = :trinhdodaotao_id) AND ' unless strinhdodaotao_id.blank?
    gioitinh_portion = ' (GioiTinh = :GioiTinh) ' unless sGioiTinh.blank?
    
    search_str='%s %s %s %s %s %s %s %s ' % [term_portion, hoten_portion, diachi_portion, sdt_portion, lop_id_portion, ngaysinh_portion,trinhdodaotao_portion,gioitinh_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMSSV,sHoTen,sDiaChi,sSDT,slop_id,sNgaySinh,strinhdodaotao_id,sGioiTinh)  
    filter_str=build_query(sMSSV,sHoTen,sDiaChi,sSDT,slop_id,sNgaySinh,strinhdodaotao_id,sGioiTinh)
    Sinhvien.includes(:lop,:trinhdodaotao).where([filter_str,
                {:MSSV=>"%#{sMSSV}%",
                  :HoTenSV=>"%#{sHoTen}%",
                  :DiaChi=>"%#{sDiaChi}%",
                  :SDT=>"#{sSDT}",
                  :lop_id=>"#{slop_id}",
                  :NgaySinh=>"#{sNgaySinh}",
                  :trinhdodaotao_id=>"#{strinhdodaotao_id}",
                  :GioiTinh=>"#{sGioiTinh}"
                }])
    
  end
  
 def self.build_query_searchdrl(slop_id,strinhdodaotao_id)
    term_portion=''
    term_portion='(lop_id=:lop_id) AND ' unless slop_id.blank?
    trinhdodaotao_portion = ' (trinhdodaotao_id = :trinhdodaotao_id) AND ' unless strinhdodaotao_id.blank?
    
    search_str='%s %s ' % [term_portion, trinhdodaotao_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission_drl(slop_id,strinhdodaotao_id)  
    filter_str=build_query_searchdrl(slop_id,strinhdodaotao_id)
    Sinhvien.includes(:lop,:trinhdodaotao).where([filter_str,
                {
                  :lop_id=>"#{slop_id}",
                  :trinhdodaotao_id=>"#{strinhdodaotao_id}",
               }])
    
  end
      
end
