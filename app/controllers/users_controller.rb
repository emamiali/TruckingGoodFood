class UsersController < ApplicationController
  before_filter :skip_password_attribute, only: :update

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Successfully Signed-in"
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @trucks = @user.trucks
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated profile!!"
      redirect_to user_path(params[:id])
    else
      flash[:error] = @user.errors
      redirect_to edit_user_path
      #check this redirect_to
    end
  end

  private

  def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except!(:password, :password_confirmation)
    end
  end

  def user_params
    params.require(:user).permit(:business_name, :email, :password, :logo, :permit_id, :avatar, :password_confirmation)
  end

end
