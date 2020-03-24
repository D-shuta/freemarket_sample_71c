class SignupController < ApplicationController
  # before_actionで2ページ目が開く前にメソッドを動かす
  before_action :save_to_session, only: :step2

  def step1
    @user = User.new # インスタンス生成
  end

  def step2
    @user = User.new # インスタンス生成
    @user.build_user_address # user_addressモデルと紐付け
  end

  def done
  end
  # sessionに保存しつつ、バリテーションかける
  def save_to_session
    # step1で入力した情報をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:first_name] = user_params[:first_name]
    session[:name] = user_params[:name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:name_kana] = user_params[:name_kana]
    session[:birthday] = user_params[:birthday]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      nickname: session[:nickname],
      first_name: session[:first_name],
      name: session[:name],
      first_name_kana: session[:first_name_kana],
      name_kana: session[:name_kana],
      birthday: session[:birthday],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
    )
    # バリテーションかけて保存ができていなかった場合step1に戻る
    render '/signup/step1' unless @user.valid?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      first_name: session[:first_name],
      name: session[:name],
      first_name_kana: session[:first_name_kana],
      name_kana: session[:name_kana],
      birthday: session[:birthday],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
      # ここまでがstep1で入力したデータ
    )
    @user.build_user_address(user_params[:user_address_attributes])
    if@user.save
      session[:user_id] = @user.id # ログイン状態を維持させるためuser_idをsessionに保存
      sign_in User.find(session[:user_id]) unless user_signed_in?
      redirect_to root_path
    else
      render '/signup/step1'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :first_name, 
      :name, 
      :first_name_kana, 
      :name_kana, 
      :birthday, 
      :email, 
      :password,
      :password_confirmation,
      :encrypted_password,
      user_address_attributes: [
        :id, :first_destinaition_name, 
        :destinaition_name,
        :first_destinaition_kana,
        :destinaition_kana,
        :postal_code,
        :prefectures,
        :municipality,
        :address,
        :building_name,
        :phone_number
      ])
  end
end
