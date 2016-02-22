class UsersController < ApplicationController

  skip_filter :authenticate, :only => [ :show, :index ]  
  before_action :require_login, :except => [:new, :create, :show]
  before_action :require_current_user, :only => [:edit, :update, :destroy]



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    if signed_in_user?
       flash[:error] = "already signed in"
       redirect_to root_path
    else
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "created successfully!"
        sign_in(@user)
        redirect_to user_path(@user)
      else
        flash[:error] = "user not created"
        render :new
      end
    end
  end


  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = User.find( params[:id])
  end

  def update
    @user = User.find( params[:id])
    if @user.update( user_params )
      flash[:notice] = "updated successfully"
      redirect_to user_path(current_user)
    else
      flash[:error] = "not successfully updated"
      render :edit
    end
  end

  def destroy
    @user = User.find( params[:id])
    if @user.destroy
      flash[:notice] = "Destroyed successfully."
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :password_confirmation )
  end
end
