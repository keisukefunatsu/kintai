class OutDatesController < ApplicationController
  include ApplicationHelper
  def new
    @user = User.find(params[:user_id])
    if @user
      create_out_date(@user)
      redirect_to root_path, notice: '帰宅確認メールを送信しました'
    else
      redirect_to root_path, notice: 'ユーザが存在しません'
    end
  end
end
