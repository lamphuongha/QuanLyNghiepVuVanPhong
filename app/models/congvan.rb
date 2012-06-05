require 'spreadsheet'
class Congvan < ActiveRecord::Base
  #has_and_belongs_to_many :phongbans
  #has_and_belongs_to_many :nhomcvs
  has_many :nhomcvs, :through => :congvans_nhomcvs
  has_many :congvans_nhomcvs
  has_many :hocbongs
  has_many :baoluus
  has_many :buocthoihocs
  has_many :noitrus
  has_many :ngoaitrus
  has_many :trocaps
  #attr_accessible :assets_attributes
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  belongs_to :loaicv
  belongs_to :nhomloaicv
  
  has_many :nguoilienquans
  has_many :giangviens, :through => :nguoilienquans 
  #attr_accessible :giangvien_tokens
  attr_reader :giangvien_tokens
    
  validates_presence_of :SoCV, :NgayRaCV, :NgayNhanCV, :NoiDungCV, :loaicv_id, :TacGia, :HocKy, :NamHoc, :message => "không được trống"
  validates_uniqueness_of :SoCV, :message => "đã tồn tại"
  
  cattr_reader :per_page
  @@per_page = 20
  
  has_attached_file :image
  
  def giangvien_tokens=(ids)
    self.giangvien_ids = ids.split(",")
  end
  def self.search(search)  
    if search  
      where('SoCV like ?  or NoiDungCV LIKE ? or TacGia LIKE ? or NguoiNhan LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%")  
    else
      scoped  
    end  
  end 
 
  def self.build_query(sSoCV,sNoiDungCV,sloaicv,sNoiGui,sNoiNhan,snhomloaicv,sTacGia,sNguoiNhan,sNgayNhan,sNgayRa,sTuNgay,sDenNgay,sNhomcv,sGiangvien)
    term_portion=''
    term_portion='(SoCV like :SoCV) AND ' unless sSoCV.blank?
    noidung_portion = ' (NoiDungCV like :NoiDungCV) AND ' unless sNoiDungCV.blank?
    loaicv_portion = ' (loaicv_id=:loaicv_id) AND ' unless sloaicv.blank?
    noigui_portion = ' (NoiGui=:NoiGui) AND ' unless sNoiGui.blank?
    noinhan_portion = ' (NoiNhan=:NoiNhan) AND ' unless sNoiNhan.blank?
    nhomloai_portion = ' (nhomloaicv_id=:nhomloaicv_id) AND ' unless snhomloaicv.blank?
    tacgia_portion = ' (TacGia like :TacGia) AND ' unless sTacGia.blank?
    nguoinhan_portion = ' (NguoiNhan like :NguoiNhan) AND ' unless sNguoiNhan.blank?
    ngaynhan_portion = ' (NgayNhanCV = :NgayNhanCV) AND' unless sNgayNhan.blank?
    ngayra_portion = ' (NgayRaCV = :NgayRaCV) AND ' unless sNgayRa.blank?
    khoangthoigian_portion = ' (NgayRaCV >= :startday AND NgayNhanCV >= :startday AND NgayRaCV <= :endday AND NgayNhanCV <= :endday) AND ' unless sTuNgay.blank? or sDenNgay.blank?
    nhomcv_portion = ' (nhomcv_id=:nhomcv_id) AND ' unless sNhomcv.blank?
    giangvien_portion = ' (giangvien_id=:giangvien_id) AND ' unless sGiangvien.blank?
    
    
    search_str='%s %s %s %s %s %s %s %s %s %s %s %s %s ' % [term_portion, noidung_portion, loaicv_portion, noigui_portion, noinhan_portion, nhomloai_portion, 
      tacgia_portion, nguoinhan_portion,ngaynhan_portion,ngayra_portion,khoangthoigian_portion,nhomcv_portion,giangvien_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sSoCV,sNoiDungCV,sloaicv,sNoiGui,sNoiNhan,snhomloaicv,sTacGia,sNguoiNhan,sNgayNhan,sNgayRa,sTuNgay,sDenNgay,sNhomcv,sGiangvien)  
      filter_str=build_query(sSoCV,sNoiDungCV,sloaicv,sNoiGui,sNoiNhan,snhomloaicv,sTacGia,sNguoiNhan,sNgayNhan,sNgayRa,sTuNgay,sDenNgay,sNhomcv,sGiangvien)
      Congvan.includes(:loaicv, :nhomloaicv).joins(:congvans_nhomcvs,:nguoilienquans).where([filter_str,
    #Congvan.includes(:loaicv, :nhomloaicv).where([filter_str,
                {:SoCV=>"%#{sSoCV}%",
                  :NoiDungCV=>"#{sNoiDungCV}",
                  :loaicv_id=>"#{sloaicv}",
                  :NoiGui=>"#{sNoiGui}",
                  :NoiNhan=>"#{sNoiNhan}",
                  :nhomloaicv_id=>"#{snhomloaicv}",
                  :TacGia=>"%#{sTacGia}%",
                  :NguoiNhan=>"%#{sNguoiNhan}%",
                  :NgayNhanCV=>"#{sNgayNhan}",
                  :NgayRaCV=>"#{sNgayRa}",
                  :startday=>"#{sTuNgay}",
                  :endday=>"#{sDenNgay}",
                  :nhomcv_id=>"#{sNhomcv}",
                  :giangvien_id=>"#{sGiangvien}"
                }]).group(:SoCV)
  end
 
  def self.build_query_for_statistic(sloaicv,sNoiGui,sNoiNhan,sTacGia,sNamHoc)
    term_portion=''
    term_portion=' (loaicv_id=:loaicv_id) AND ' unless sloaicv.blank?
    noigui_portion = ' (NoiGui=:NoiGui) AND ' unless sNoiGui.blank?
    noinhan_portion = ' (NoiNhan=:NoiNhan) AND ' unless sNoiNhan.blank?
    tacgia_portion = ' (TacGia like :TacGia) AND ' unless sTacGia.blank?
    khoangthoigian_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?   
    
    search_str='%s %s %s %s %s' % [term_portion, noigui_portion, noinhan_portion, 
      tacgia_portion,khoangthoigian_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_for_statistic(sloaicv,sNoiGui,sNoiNhan,sTacGia,sNamHoc)  
      filter_str=build_query_for_statistic(sloaicv,sNoiGui,sNoiNhan,sTacGia,sNamHoc)
      Congvan.includes(:loaicv, :nhomloaicv).where([filter_str,
                {
                  :loaicv_id=>"#{sloaicv}",
                  :NoiGui=>"#{sNoiGui}",
                  :NoiNhan=>"#{sNoiNhan}",
                  :TacGia=>"%#{sTacGia}%",
                  :NamHoc => "#{sNamHoc}",
                }])
  end  
  
   
  
end
