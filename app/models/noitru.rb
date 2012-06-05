class Noitru < ActiveRecord::Base
  belongs_to :congvan
  has_many :chitietnoitrus
  has_many :sinhviens, :through => :chitietnoitrus
  
  validates_presence_of :MaNoiTru, :TenNoiTru, :congvan_id, :HocKy, :NamHoc, :message => "không được trông"
  validates_uniqueness_of :MaNoiTru, :message => "đã tồn tại"

  cattr_reader :per_page
  @@per_page = 20
  def self.search(search)  
    if search  
      where('MaNoiTru = ?  or TenNoiTru LIKE ? or HocKy = ? or NamHoc = ?', "#{search}","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaNoiTru,sTenNoiTru,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaNoiTru = :MaNoiTru) AND ' unless sMaNoiTru.blank?
    tennoitru_portion = ' (TenNoiTru like :TenNoiTru) AND ' unless sTenNoiTru.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s  ' % [term_portion, tennoitru_portion, congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaNoiTru,sTenNoiTru,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaNoiTru,sTenNoiTru,scongvan_id,sHocKy,sNamHoc)
    Noitru.includes(:congvan).where([filter_str,
                {:MaNoiTru=>"#{sMaNoiTru}",
                  :TenNoiTru=>"%#{sTenNoiTru}%",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
  
end
