class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
    # @items = Item.all
  end

  def show

  end

  def create
    warehouse = Warehouse.new(warehouse_params)
    if warehouse.save
      redirect_to warehouses_path, notice: "Warehouse successfully created"
    else
      redirect_to new_warehouse_path, notice: "Please properly fill in all fields."
    end
  end

  def update
    # if params[:add_item].present?
    # add item method
    warehouse = Warehouse.find_by(id: params[:id])
    item = Item.find_by(id: params["items"][1].to_i)
    warehouse.add_item(item)
    redirect_to warehouses_path
  end

  private

  def warehouse_params
    params.permit(:name, :location)
  end
end
