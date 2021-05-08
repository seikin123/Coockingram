class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) #一人のユーザーの情報のみ持ってくる
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) #id番号さえわかれば良い どのユーザーかを見つけてくる
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params #ストロングパラメーター
    params.require(:user).permit(:username, :email, :profile, :profile_iamge) #許可されているキー
  end

end
