class Chucvu < ActiveRecord::Base
   has_many :giangviens
   validates_presence_of :MaCV, :TenCV
 validates_uniqueness_of :MaCV
 
end
