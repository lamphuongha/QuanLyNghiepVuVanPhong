class Chucvu < ActiveRecord::Base
   has_many :giangviens
   validates_presence_of :MaCV, :TenCV, :message => "không được trống"
 validates_uniqueness_of :MaCV, :message => "đã tồn tại"
 
end
