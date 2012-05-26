class Ngach < ActiveRecord::Base
    has_many :giangviens
  validates_presence_of :MaNgach, :TenNgach
 validates_uniqueness_of :MaNgach
end
