class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update,]


  def index
    @items = Item.includes(:user).order('created_at DESC')
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


  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    #binding.pry
    if@item.update(item_params)
      redirect_to item_path(@item)
    else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      render 'edit'
    end
  end


private

 def item_params
  params.require(:item).permit(:image, :name, :explanation, :category_id, :derively_fee_id, :status_id, :prefecture_id, :send_day_id, :price).merge(user_id: current_user.id)
 end

 def move_to_index
  @item = Item.find(params[:id])
  unless current_user == @item.user #現在ログインしている人がプロトタイプ投稿者以外だったら
    redirect_to action: :index
  end
 end
  # def set_item
  #  @item = Item.find(params[:id])
  # end  binding.pry


end

