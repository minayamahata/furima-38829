class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :update, :show]
  before_action :prevent_url, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
  end

  def update
    @item.update(item_params)
    if  @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

    private

    def item_params
      params.require(:item).permit(:image, :name, :discription, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                  :shipping_day_id, :price).merge(user_id: current_user.id)
    end

    def set_furima
      @item = Item.find(params[:id])
    end

    def prevent_url
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end
end
