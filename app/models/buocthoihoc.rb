class Buocthoihoc < ActiveRecord::Base
  belongs_to :loaibuocthoihoc
  belongs_to :congvan
  has_many :chitietbuocthoihocs
  has_many :sinhviens, :through => :chitietbuocthoihocs
  
  
  validates_presence_of :MaBTH, :TenBTH, :loaibuocthoihoc_id,:congvan_id, :HocKy, :NamHoc, :message => "không được trống"
  validates_uniqueness_of :MaBTH,:message => "đã tồn tại"

    cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MaBTH = ?  or TenBTH LIKE ? or TenLoaiBTH = ? or SoCV LIKE ? or buocthoihocs.HocKy = ? or buocthoihocs.NamHoc = ?', "#{search}","%#{search}%","#{search}","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaBTH,sTenBTH,sloaibuocthoihoc_id,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaBTH = :MaBTH) AND ' unless sMaBTH.blank?
    tenbaoluu_portion = ' (TenBTH like :TenBTH) AND ' unless sTenBTH.blank?
    loaibuocthoihoc_portion = ' (loaibuocthoihoc_id=:loaibuocthoihoc_id) AND ' unless sloaibuocthoihoc_id.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s %s ' % [term_portion, tenbaoluu_portion,loaibuocthoihoc_portion, congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaBTH,sTenBTH,sloaibuocthoihoc_id,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaBTH,sTenBTH,sloaibuocthoihoc_id,scongvan_id,sHocKy,sNamHoc)
    Buocthoihoc.includes(:loaibuocthoihoc,:congvan).where([filter_str,
                {:MaBTH=>"#{sMaBTH}",
                  :TenBTH=>"%#{sTenBTH}%",
                  :loaibuocthoihoc_id=>"#{sloaibuocthoihoc_id}",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
end
