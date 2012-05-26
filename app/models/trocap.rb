class Trocap < ActiveRecord::Base
  belongs_to :loaitrocap
  belongs_to :congvan
  has_many :chitiettrocaps
  has_many :sinhviens, :through => :chitiettrocaps
  
  
  validates_presence_of :MaTroCap, :TenTroCap, :loaitrocap_id, :congvan_id, :HocKy, :NamHoc
  validates_uniqueness_of :MaTroCap
  
  cattr_reader :per_page
  @@per_page = 20
  def self.search(search)  
    if search  
      where('MaTroCap = ?  or TenTroCap LIKE ? or HocKy = ? or NamHoc = ?', "#{search}","%#{search}%","#{search}","#{search}")  
    else
      scoped  
    end  
  end 
  def self.build_query(sMaTroCap,sTenTroCap,sloaitrocap_id,scongvan_id,sHocKy,sNamHoc)
    term_portion=''
    term_portion='(MaTroCap = :MaTroCap) AND ' unless sMaTroCap.blank?
    tentrocap_portion = ' (TenTroCap like :TenTroCap) AND ' unless sTenTroCap.blank?
    loaitrocap_portion = ' (loaitrocap_id=:loaitrocap_id) AND ' unless sloaitrocap_id.blank?
    congvan_portion = ' (congvan_id=:congvan_id) AND ' unless scongvan_id.blank?
    hocky_portion = ' (HocKy=:HocKy) AND ' unless sHocKy.blank?
    namhoc_portion = ' (NamHoc=:NamHoc) AND ' unless sNamHoc.blank?
    
    search_str='%s %s %s %s %s %s ' % [term_portion, tentrocap_portion, loaitrocap_portion,congvan_portion, hocky_portion, 
      namhoc_portion]
    search_str.strip!
    search_str.gsub!(/^(AND +)+/,'')
    search_str.gsub!(/( +AND)+$/,'')
    return search_str
  end
  
  def self.search_with_permission(sMaTroCap,sTenTroCap,sloaitrocap_id,scongvan_id,sHocKy,sNamHoc)  
      filter_str=build_query(sMaTroCap,sTenTroCap,sloaitrocap_id,scongvan_id,sHocKy,sNamHoc)
    Trocap.includes(:loaitrocap,:congvan).where([filter_str,
                {:MaTroCap=>"#{sMaTroCap}",
                  :TenTroCap=>"%#{sTenTroCap}%",
                  :loaitrocap_id=>"#{sloaitrocap_id}",
                  :congvan_id=>"#{scongvan_id}",
                  :HocKy=>"#{sHocKy}",
                  :NamHoc=>"#{sNamHoc}",
                }])
  end
end
