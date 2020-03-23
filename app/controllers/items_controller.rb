class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]


  def index
    @items = Item.includes(:images, :category, :seller).order('created_at DESC').limit(3)
  end

  def new 
    @item = Item.new
    @item.images.new

    def get_category_children
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = '必須項目に漏れがあります。'
      redirect_to new_item_path
    end
  end



  private

  def set_category
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end
  end
  
  def item_params
    params.require(:item).permit(
      :name, :content, :state, :postage, :shipping_id, :prefecture_id, :price,
      :category_id, :brand,
      images_attributes: [:image] 
    ).merge(seller_id: current_user.id)
  end
end

