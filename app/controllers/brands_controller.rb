class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end
#ブランド一覧、登録は必須ではないので追加するなら
end
