class Public::UsersController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
    @memories = MemoryUser.where(user_id: current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_root_path, notice: "success"
    else
      render edit
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guest"
    end
    sign_in user
    redirect_to user_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :user_image, :is_deleted)
  end

end
