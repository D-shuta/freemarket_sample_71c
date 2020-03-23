require 'rails_helper'

  describe Item do
    describe '#create' do
      # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
      it "必須項目が入力済みであれば投稿できる" do
        item = build(:item)
        expect(item).to be_valid
      end

    end
  end