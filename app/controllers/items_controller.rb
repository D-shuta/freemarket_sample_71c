class ItemsController < ApplicationController

  def new 
    @item = Item.new
    @item.images.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private
  
  def item_params
    params.require(:item).permit(
      :name, :content, :state, :postage, :shipping_id, :prefecture_id, :price,
      # :category,
      images_attributes: [:image] 
    )
  end
end

