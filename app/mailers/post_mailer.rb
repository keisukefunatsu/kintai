class PostMailer < ApplicationMailer
  default from: 'noreplycommitedu@gmail.com'

  def post_email(user, status, time)
    @user = user
    @status = status
    @time = time
    mail to: @user.email, subject: '【個別指導塾COMMIT】出席確認メール'
  end
end
