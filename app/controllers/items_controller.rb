class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    # To ensure users cannot create an item before creating a warehouse
    if current_user.warehouses.empty?
      @warehouse = Warehouse.new
      redirect_to new_warehouse_path, notice: "Please create a warehouse first"
    else
      @item = Item.new
    end
  end

  def create
    @item = Item.new(item_params)

    # Assigning the selected warehouse to the new item
    @item.warehouse = Warehouse.find(params[:item][:warehouse_id])

    # Assigning the current user to the new item
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

    # Updating the selected warehouse of the item
    @item.warehouse = Warehouse.find(params[:item][:warehouse_id])

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
    params.require(:item).permit(:name, :quantity, :description, :warehouse_id, :photo)
  end
end
