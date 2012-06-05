
# To change this template, choose Tools | Templates
# and open the template in the editor

class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||=User.new #guest
    
    #if user.role? "1"
    #  can :manage, :all
    #else
    #  can :read, :all
    #end
    if user.present?
      if (user.role_id == 1)
        can :manage, :all
   #     crud_users(user)
      else
        #ru_profile(user)
        #ru_account(user)
        manager(user) if user.role_id == 2
        basic(user) if user.role_id == 3
      end
    end
    can [:new,:create], User
    
  end
  
    private
  #def ru_account(user)
  #  can [:manage], User do |p|
  #    p && p.id==user
  #  end
  #end
  def manager(user)
    crud_congvans(user)
    crud_covanhoctaps(user)
    crud_baoluus(user)
    crud_buocthoihocs(user)
    crud_buocthoihocs(user)
    crud_diemrenluyens(user)
    crud_giangviens(user)
    crud_hocbongs(user)
    crud_hocvis(user)
    crud_ngachs(user)
    crud_ngoaitrus(user)
    crud_noitrus(user)
    crud_trocaps(user)
    crud_sinhviens(user)
    crud_lops(user)
    
  end
  def basic(user)
    #user can only write to owned obj
    #r_covanhoctaps(user)
    crud_diemrenluyens(user)
    ru_giangvien(user)
    ru_sinhvien(user)
    r_congvans(user)
  end
  
  def crud_congvans(user)
    can [:create,:read,:update,:destroy,:search], Congvan
  end
  def crud_covanhoctaps(user)
    can [:create,:read,:update,:destroy,:search], Covanhoctap
  end
  def crud_baoluus(user)
    can [:create,:read,:update,:destroy,:search], Baoluu
  end
  def crud_buocthoihocs(user)
    can [:create,:read,:update,:destroy,:search], Buocthoihoc
  end
  def crud_diemrenluyens(user)
    can [:create,:read,:update,:destroy,:search], Diemrenluyen
  end
  def crud_giangviens(user)
    can [:create,:read,:update,:destroy,:search], Giangvien
  end
  def crud_hocbongs(user)
    can [:create,:read,:update,:destroy,:search,:export_hocbongs], Hocbong
  end
  def crud_hocvis(user)
    can [:create,:read,:update,:destroy], Hocvi
  end
  def crud_ngachs(user)
    can [:create,:read,:update,:destroy], Ngach
  end
  def crud_ngoaitrus(user)
    can [:create,:read,:update,:destroy,:search], Ngoaitru
  end
  def crud_noitrus(user)
    can [:create,:read,:update,:destroy,:search], Noitru
  end
  def crud_trocaps(user)
    can [:create,:read,:update,:destroy,:search], Trocap
  end
  def ru_giangvien(user)
    can [:update], Giangvien do |p|
      p && p.id == user.giangvien_id
    end
  end
  def crud_sinhviens(user)
    can [:create,:read,:update,:destroy,:search], Sinhvien
  end
  def crud_lops(user)
    can [:create,:read,:update,:destroy], Lop
  end
  def ru_sinhvien(user)
    can [:read,:search], Sinhvien
  end
  def r_congvans(user)
    can [:read,:search], Congvan
  end
  ## can [:new,:create], User
    #can [:create], User
  #end
  
end
