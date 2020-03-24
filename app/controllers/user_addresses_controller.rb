class UserAddressesController < ApplicationController
  before_action :authenticate_user! 

  def new
    # user_addressテーブルのインスタンス生成
    @user_address = UserAddress.new
  end

  def create
    # user_addressの登録
    @user_address = UserAddress.new(user_address_params)
    # 保存保存できなかったら登録画面に戻る
    if @user_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def  user_address_params
    params.require(:user_address).permit(:first_destinaition_name, :destinaition_name, :first_destinaition_kana,:destinaition_kana, :postal_code, :prefectures, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
end
end

