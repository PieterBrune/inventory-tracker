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
      redirect_to warehouse_path(@item.warehouse), notice: "#{@item.name} added."
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
    @item.warehouse = Warehouse.find(params[:item][:warehouse].to_i)
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "#{@item.name} updated."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to warehouse_path(@item.warehouse), notice: "#{@item.name} destroyed."
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :description, :photo)
  end
end
