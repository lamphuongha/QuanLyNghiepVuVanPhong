class Hocvi < ActiveRecord::Base
  has_many :giangviens
  validates_presence_of :MaHocVi, :TenHocVi, :message => "không được trống"
 validates_uniqueness_of :MaHocVi, :message => "đã tồn tại"
end
