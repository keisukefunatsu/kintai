class TeachersController < ApplicationController
  def index
    if params[:grade_id]
      @grade_id = params[:grade_id]
      @users = User.where(grade_id: @grade_id).order(created_at: :desc).page(params[:page])
    else
      @users = User.order(created_at: :desc).page(params[:page])
    end
  end
end
