class GiangvienMailer < ActionMailer::Base
  default :from => "bangtamha@gmail.com"
  def send_mail(user)
    #@user = user
    mail :to => user.email, :subject => "Công văn liên quan"
  end
end
