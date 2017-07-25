class OutDatesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user.out_dates.create(user_id: params[:user_id], out: Time.current)
    @time = Time.current
    @status = 'out'
    PostMailer.post_email(@user, @status, @time).deliver
    @user.update(present: '2')
    redirect_to root_path, notice: '出欠確認メールを送信しました'
  end
end
