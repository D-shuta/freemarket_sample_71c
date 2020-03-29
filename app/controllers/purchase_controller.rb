class PurchaseController < ApplicationController

  require 'payjp'

  def show
    @item=Item.find(params[:id])
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_07dfbaa24e71a735bd63abb6"
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item=Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_07dfbaa24e71a735bd63abb6"
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    @item.update(buyer_id: current_user.id)
    redirect_to done_purchase_path
  end

  def done
    item = Item.find(params[:id])
    item.save!
    redirect_to root_path
  end

  private
  def purchase_params
    params.permit(:id,:name,:price,).merge(buyer_id: current_user.id)

  end

end