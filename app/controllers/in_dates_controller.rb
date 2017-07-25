class InDatesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user.in_dates.create(user_id: params[:user_id], in: Time.current)
    @time = Time.current
    @status = 'in'
    PostMailer.post_email(@user, @status, @time).deliver
    @user.update(present: '1')
    redirect_to root_path, notice: '出席メールを送信しました'
  end
end
