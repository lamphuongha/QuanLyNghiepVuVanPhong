class Loaisinhvien < ActiveRecord::Base
  belongs_to :sinhviens
has_many :chitietloaisvs
   validates_presence_of :MaLoaiSv, :TenLoaiSv
 validates_uniqueness_of :MaLoaiSv
end
