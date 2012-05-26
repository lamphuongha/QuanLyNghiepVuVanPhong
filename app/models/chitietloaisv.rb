class Chitietloaisv < ActiveRecord::Base
  belongs_to :loaisinhviens
  belongs_to :sinhviens
   validates_presence_of :MaLoaiSv, :TenLoaict
 validates_uniqueness_of :MaLoaiSv
end
