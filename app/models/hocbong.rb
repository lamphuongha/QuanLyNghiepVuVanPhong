class Hocbong < ActiveRecord::Base
  belongs_to :congvan
  belongs_to :loaihocbong
  has_many :chitiethocbongs
  has_many :sinhviens, :through => :chitiethocbongs
  
  validates_presence_of :MaHocBong, :TenHocBong, :loaihocbong_id, :congvan_id, :NoiCap, :HocKy, :NgayLap, :NamHoc
  validates_uniqueness_of :MaHocBong
  
  cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MaHocBong = ?  or TenHocBong LIKE ? or TenLoaiHocBong LIKE? or SoCV LIKE ? or NoiCap LIKE ? or hocbongs.HocKy = ? or hocbongs.NamHoc = ?', "#{search}","%#{search}%","%#{search}%","%#{search}%","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaHocBong,sTenHocBong,sloaihocbong_id,scongvan_id,sNoiCap,sHocKy,sNamHoc,sNgayLap)
    term_portion=''
    term_portion='(MaHocBong like :MaHocBong) AND ' unless sMaHocBong.blank?
    tenhocbong_portion = ' (TenHocBong like :TenHocBong) AND ' unless sTenHocBong.blank?
    loaihocbong_portion = ' (loaihocbong_id=:loaihocbong_id) AND ' unless sloaihocbong_id.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    noicap_portion = ' (NoiCap like :NoiCap) AND ' unless sNoiCap.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    ngaylap_portion = ' (NgayLap=:NgayLap) AND ' unless sNgayLap.blank?
    
    search_str='%s %s %s %s %s %s %s %s ' % [term_portion, tenhocbong_portion, loaihocbong_portion, congvan_portion, noicap_portion, hocky_portion, 
      namhoc_portion, ngaylap_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaHocBong,sTenHocBong,sloaihocbong_id,scongvan_id,sNoiCap,sHocKy,sNamHoc,sNgayLap)  
      filter_str=build_query(sMaHocBong,sTenHocBong,sloaihocbong_id,scongvan_id,sNoiCap,sHocKy,sNamHoc,sNgayLap)
    Hocbong.includes(:loaihocbong, :congvan).where([filter_str,
                {:MaHocBong=>"%#{sMaHocBong}%",
                  :TenHocBong=>"%#{sTenHocBong}%",
                  :loaihocbong_id=>"#{sloaihocbong_id}",
                  :congvan_id=>"#{scongvan_id}",
                  :NoiCap=>"%#{sNoiCap}%",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                  :NgayLap=>"#{sNgayLap}",
                }])
  end
end
