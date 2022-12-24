class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'
 
  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect :show
    end
  end

  private

  def require_login
    redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :delivery_charge_id, :shipping_day_id, :prefecture_id, :condition_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end
