class WarehousesController < ApplicationController
  before_action :authenticate_user!

  def new
    @warehouse = Warehouse.new
  end

end
