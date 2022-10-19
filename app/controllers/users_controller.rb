class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:user_home]}
  before_action :forbid_login_user, {only: [:signin_form, :signin, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:user_home]}

  def signin_form
  end

  def signin
    @user = User.new(
      email: params[:email],
      name: params[:name],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}/user_home")
    else
      render("users/signin_form")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}/user_home")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/top/home")
  end

  def user_home
    @characters = Character.where(user_id: @current_user.id).order(id: :desc)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}/user_home")
    end
  end
end
