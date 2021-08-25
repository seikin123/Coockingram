class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following_user
    # @users = @user
    render 'follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'follower'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) #一人のユーザーの情報のみ持ってくる
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id]) #id番号さえわかれば良い どのユーザーかを見つけてくる
    @user.update(user_params)
    redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
  end

  private
  def user_params #ストロングパラメーター
    params.require(:user).permit(:username, :email, :profile, :profile_image) #許可されているキー
  end
end
