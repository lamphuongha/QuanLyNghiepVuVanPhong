class Lop < ActiveRecord::Base
  #has_and_belongs_to_many :giangviens
  has_many :sinhviens
  has_many :covanhoctaps
  has_many :giangviens, :through => :covanhoctaps
  
  validates_presence_of :MaLop, :TenLop
  validates_uniqueness_of :MaLop, :TenLop
  
  cattr_reader :per_page
  @@per_page = 20
  
  def self.search(search)  
    if search  
      where('MaLop = ?  or TenLop LIKE ?', "#{search}","%#{search}%")  
    else
      scoped  
    end  
  end 
end
