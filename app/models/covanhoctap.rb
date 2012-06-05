class Covanhoctap < ActiveRecord::Base
  belongs_to :giangvien
  belongs_to :lop
  validates_presence_of :giangvien_id, :lop_id, :HocKy, :NamHoc, :message => "không được trống"
 #validates_uniqueness_of :giangvien_id

  cattr_reader :per_page
  @@per_page = 20
  
  
def self.search(search)  
    if search  
      where('HoTenGV = ?  or TenLop = ? or HocKy = ? or NamHoc = ?', "#{search}","#{search}","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
 
  def self.build_query(sgiangvien_id,slop_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion=' (giangvien_id=:giangvien_id) AND ' unless sgiangvien_id.blank?
    lop_portion = ' (lop_id=:lop_id) AND ' unless slop_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s ' % [term_portion, lop_portion, hocky_portion, namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sgiangvien_id,slop_id,sHocKy,sNamHoc)  
      filter_str=build_query(sgiangvien_id,slop_id,sHocKy,sNamHoc)
    Covanhoctap.includes(:giangvien, :lop).where([filter_str,
                { :giangvien_id=>"#{sgiangvien_id}",
                  :lop_id=>"#{slop_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
  
end
