class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  def index
    if params[:grade_id]
      @grade_id = params[:grade_id]
      @users = User.where(grade_id: @grade_id).order(created_at: :desc).page(params[:page])
      @grade = Grade.all
    else
      @users = User.order(created_at: :desc).page(params[:page])
      @grade = Grade.all
    end
  end

  def card_read
    @uuid = params[:uuid]
    @user = User.find_by(card_uuid: @uuid.to_s)
    if @user
      if @user.present == '3'
        # if check_in_date(@user)
        #   respond_to do |format|
        #     format.json { render json: 'まだ帰りますボタンは押せません'.to_json }
        #   end
        # end
        create_in_date(@user)
        respond_to do |format|
          format.json { render json: "#{@user.name}さんが塾に来ました".to_json }
        end
      elsif @user.present == '1'
        create_out_date(@user)
        respond_to do |format|
          format.json { render json: "#{@user.name}さんが帰宅しました".to_json }
        end
      elsif @user.present == '2'
        respond_to do |format|
          format.json { render json: "#{@user.name}さんは既に帰宅済みです".to_json }
        end
      end
    else
      respond_to do |format|
        format.json { render json: 'カードが登録されていなかったか、正常に読み取れませんでした　正しいカードIDを追加して下さい'.to_json }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :grade_id, :present, :card_uuid)
  end
end
