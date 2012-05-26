class Hocvi < ActiveRecord::Base
  has_many :giangviens
  validates_presence_of :MaHocVi, :TenHocVi
 validates_uniqueness_of :MaHocVi
end
