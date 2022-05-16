class WarehousesController < ApplicationController
  before_action :authenticate_user!

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    @warehouse.user = current_user

    if @warehouse.save
      redirect_to :dashboard, notice: "Warehouse Added"
    else
      render :new
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @items = @warehouse.items
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update(warehouse_params)
      redirect_to warehouse_path(@warehouse), notice: "Warehouse updated."
    else
      render :edit
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :street_address, :city, :postal_code, :country)
  end

end
