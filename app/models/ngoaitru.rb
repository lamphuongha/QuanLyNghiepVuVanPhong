class Ngoaitru < ActiveRecord::Base
  belongs_to :loaingoaitru
  belongs_to :congvan
  has_many :chitietngoaitrus
  has_many :sinhviens, :through => :chitietngoaitrus
  
  
  validates_presence_of :MaNgoaiTru, :TenNgoaiTru, :loaingoaitru_id,:congvan_id, :HocKy, :NamHoc
  validates_uniqueness_of :MaNgoaiTru
   cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MaNgoaiTru = ?  or TenNgoaiTru LIKE ? or HocKy = ? or NamHoc = ?', "#{search}","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaNgoaiTru,sTenNgoaiTru,sloaingoaitru_id,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaNgoaiTru = :MaNgoaiTru) AND ' unless sMaNgoaiTru.blank?
    tenngoaitru_portion = ' (TenNgoaiTru like :TenNgoaiTru) AND ' unless sTenNgoaiTru.blank?
    loaingoaitru_portion = ' (loaingoaitru_id=:loaingoaitru_id) AND ' unless sloaingoaitru_id.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s %s ' % [term_portion, tenngoaitru_portion,loaingoaitru_portion, congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaNgoaiTru,sTenNgoaiTru,sloaingoaitru_id,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaNgoaiTru,sTenNgoaiTru,sloaingoaitru_id,scongvan_id,sHocKy,sNamHoc)
    Ngoaitru.includes(:loaingoaitru,:congvan).where([filter_str,
                {:MaNgoaiTru=>"#{sMaNgoaiTru}",
                  :TenNgoaiTru=>"%#{sTenNgoaiTru}%",
                  :loaingoaitru_id=>"#{sloaingoaitru_id}",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
  
end
