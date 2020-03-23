require 'rails_helper'

  describe Item do
    describe '#create' do
      # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
      it "必須項目が入力済みであれば投稿できる" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "商品名が空欄では出品できない" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "商品説明が空欄では出品できない" do
        item = build(:item, content: nil)
        item.valid?
        expect(item.errors[:content]).to include("can't be blank")
      end

      it "商品状態が空欄では出品できない" do
        item = build(:item, state: nil)
        item.valid?
        expect(item.errors[:state]).to include("can't be blank")
      end

      it "配送日数が空欄では出品できない" do
        item = build(:item, shipping_id: nil)
        item.valid?
        expect(item.errors[:shipping_id]).to include("can't be blank")
      end

      it "配送元が空欄では出品できない" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
      end

      it "金額が空欄では出品できない" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it "seller_idが空欄では出品できない" do
        item = build(:item, seller_id: nil)
        item.valid?
        expect(item.errors[:seller_id]).to include("can't be blank")
      end

      it "category_id が空欄では出品できない" do
        item = build(:item, postage: nil)
        item.valid?
        expect(item.errors[:postage]).to include("can't be blank")
      end

    end
  end