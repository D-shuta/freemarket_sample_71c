class CardsController < ApplicationController

  #pay.jp必須
  require = 'pay.jp'

  #newメソッド、カードテーブルのユーザーIDとログイン中のユーザーIDを持って来る
  #カードのサブクエリ
  def new
    card = Card.where(user_id: current_user.id)
    # binding.pry
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース
    #pay.jpのapiキーを定義
    Payjp.api_key = "sk_test_07dfbaa24e71a735bd63abb6"
    #トークンが無いとnewに飛ぶ,blank=空白
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      #新規で作成
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id:customer.default_card)
      #作られたら完了画面へ
      if @card.save
        redirect_to action: "show"
        #不備があれば戻る
      else
        redirect_to action: "pay"
      end
    end
  end

  #deleteメソッド=指定したレコードをActiveRecordを介さないでSQLを直接実行して削除する。
  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_07dfbaa24e71a735bd63abb6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    #.firstでuser_idのみ取り出し
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_07dfbaa24e71a735bd63abb6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      #retrieve=取り戻す
    end
  end
end

#pay.jp用に編集

#   def destroy
#     @card = Card.find(params[:id])
#     card.destroy
#   end

#   def edit
#     @card = Card.find(params[:id])
#   end

#   def update
#     @card = Card.find(params[:id])
#     card.update(card_params)
#   end

#   private
#   def card_params
#     params.require(:cade).permit(:card_name,:card_number,:cvc,:exp_month,:exp_year)
    
#   end
# end
