class UsersController < ApplicationController

  skip_filter :authenticate, :only => [ :show, :index ]  
  before_action :require_login, :except => [:new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user) 
      flash[:success] = "created new user"
      redirect_to @user
    else
      flash.now[:error] = "did not create user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user && current_user.update( user_params )
      flash[:success] = "updated user"
      redirect_to current_user
    else
      flash.now[:error] = "did not update user"
      render :edit
     end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user && current_user.desttroy
      sign_out
      flash[:success] = "deleted user"
      redirect_to root_path
    else
      flash[:error] = "did not delete user"
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
