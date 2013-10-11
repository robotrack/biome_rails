class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy 

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  # New user action
  def new
    @user = User.new
  end

  # Create new user based on user_params.
  # If user is saved correctly redirect to user path
  # else render new action.
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Success - Welcome aboard!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # Updates user with user_params if can find by id.
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Show user action
  def show
    @user = User.find(params[:id])
  end

  # Edit user by id
  def edit
  end

  private

    # Required parameters for user
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
