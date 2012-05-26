class Baoluu < ActiveRecord::Base
  belongs_to :congvan
  has_many :chitietbaoluus
  has_many :sinhviens, :through => :chitietbaoluus
  
  validates_presence_of :MaBaoLuu, :TenBaoLuu, :congvan_id, :HocKy, :NamHoc
  validates_uniqueness_of :MaBaoLuu
  
  cattr_reader :per_page
  @@per_page = 20
  def self.search(search)  
    if search  
      where('MaBaoLuu = ?  or TenBaoLuu LIKE ? or SoCV LIKE ? or baoluus.HocKy = ? or baoluus.NamHoc = ?', "#{search}","%#{search}%","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaBaoLuu,sTenBaoLuu,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaBaoLuu = :MaBaoLuu) AND ' unless sMaBaoLuu.blank?
    tenbaoluu_portion = ' (TenBaoLuu like :TenBaoLuu) AND ' unless sTenBaoLuu.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s  ' % [term_portion, tenbaoluu_portion, congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaBaoLuu,sTenBaoLuu,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaBaoLuu,sTenBaoLuu,scongvan_id,sHocKy,sNamHoc)
    Baoluu.includes(:congvan).where([filter_str,
                {:MaBaoLuu=>"#{sMaBaoLuu}",
                  :TenBaoLuu=>"%#{sTenBaoLuu}%",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
  
end
