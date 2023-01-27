class Public::UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(current_user.id)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      user.nickname = "guest"
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to user_root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
