class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:update, :show]


  def index
    @items = Item.where(buyer_id: nil).includes(:images, :category, :seller).order('created_at DESC').limit(3)
    @recommend = Item.where(buyer_id: nil).includes(:images, :category, :seller).order("RAND()").limit(3)

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

  def show
    @item = Item.find(params[:id])
    @user = @item.seller
    @category = @item.category
  end

  def get_category_children
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def edit
    @item.images
    @category_parent_array = Category.where(ancestry: nil)
    @item_root_category = @item.category.root
    @item_children_category = @item_root_category.children
    item_parent_category = @item.category.parent
    @item_grandcildren_category = item_parent_category.children
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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
      :name, :content, :postage,:state_id, :shipping_id, :prefecture_id, :price,
      :category_id, :brand,
      images_attributes: [:image, :_destroy, :id] 
    ).merge(seller_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    
    return if user_signed_in? && current_user.id == @item.seller_id
    redirect_to action: :index
    flash[:alert] = "指定のページにはアクセスできません"
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

