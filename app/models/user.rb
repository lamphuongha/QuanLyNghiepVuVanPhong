class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :giangvien_id, :role_id
  #attr_accessor :password
  #before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password,:on => :create
  validates_presence_of :email, :giangvien_id
  validates_uniqueness_of :email, :giangvien_id
  before_create { generate_token(:auth_token) }
  belongs_to :giangvien
  belongs_to :role
 
  

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    #UserMailer.password_reset(self).deliver
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.hex()
    end while User.exists?(column => self[column])
  end
  
  def role?(role)
    role.include? role.to_s
  end
  
  
end
