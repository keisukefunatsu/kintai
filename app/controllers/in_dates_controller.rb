class InDatesController < ApplicationController
  include ApplicationHelper
  def new
    @user = User.find(params[:user_id])
    if @user
      create_in_date(@user)
      redirect_to root_path, notice: '出席確認メールを送信しました'
    else
      redirect_to root_path, notice: 'ユーザが存在しません'
    end
  end
end
