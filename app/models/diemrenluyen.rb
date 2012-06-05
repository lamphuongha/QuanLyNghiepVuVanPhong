class Diemrenluyen < ActiveRecord::Base
  belongs_to :congvan
  has_many :chitietdiemrenluyens, :dependent => :destroy
  has_many :sinhviens, :through => :chitietdiemrenluyens
  accepts_nested_attributes_for :chitietdiemrenluyens, :allow_destroy => true
  
  validates_presence_of :MaDRL, :TenDRL,:congvan_id, :HocKy, :NamHoc , :message => "không được trống"
  validates_uniqueness_of :MaDRL, :message => "đã tồn tại"

    cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MaDRL = ?  or TenDRL LIKE ? or  SoCV LIKE ? or diemrenluyens.HocKy = ? or diemrenluyens.NamHoc = ?', "#{search}","%#{search}%","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaDRL,sTenDRL,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaDRL = :MaDRL) AND ' unless sMaDRL.blank?
    tendiemrenluyen_portion = ' (TenDRL like :TenDRL) AND ' unless sTenDRL.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s ' % [term_portion, tendiemrenluyen_portion, congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaDRL,sTenDRL,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaDRL,sTenDRL,scongvan_id,sHocKy,sNamHoc)
    Diemrenluyen.includes(:congvan).where([filter_str,
                {:MaDRL=>"#{sMaDRL}",
                  :TenDRL=>"%#{sTenDRL}%",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
  

  
end
