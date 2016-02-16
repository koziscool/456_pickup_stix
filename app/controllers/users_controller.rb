class UsersController < ApplicationController

  skip_filter :authenticate, :only => [ :show, :index ]  
  before_action :require_login, :except => [:new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)  # <<<<<<<
      flash[:success] = "Created new user!"
      redirect_to @user
    else
      flash.now[:error] = "Failed to Create User!"
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if current_user.update(whitelisted_user_params)
        flash[:success] = "Successfully updated your profile"
        redirect_to current_user
      else
        flash.now[:failure] = "Failed to update your profile"
        render :edit
       end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    current_user.destroy
    sign_out
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whitelisted_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
