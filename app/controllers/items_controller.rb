class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.warehouse = Warehouse.find(params[:item][:warehouse].to_i)


    @item.user = current_user

    if @item.save
      redirect_to warehouse_path(@item.warehouse), notice: "Item added."
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :description, :photo)
  end
end
