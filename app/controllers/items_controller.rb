class ItemsController < ApplicationController
  #before_action :set_parents, only: [:new, :create]
  before_action :authenticate_user!, except: [:index,]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
private

 def item_params
  params.require(:item).permit(:image, :name, :explanation, :category_id, :derively_fee_id, :status_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
 end
 def set_item
  @item = Item.find(params[:id])
 end


end

