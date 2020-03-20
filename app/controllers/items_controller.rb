class ItemsController < ApplicationController

  def new 
    @item = Item.new
    @item.images.build
  end

  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(
      :name, :content, :state, :postage, :shipping_date, :price, :region,
      images_attributes: {image: []}
    )
  end
end

