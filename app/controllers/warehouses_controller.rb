class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def create
    warehouse = Warehouse.new(warehouse_params)
    if warehouse.save
      redirect_to warehouses_path, notice: "Warehouse successfully created"
    else
      redirect_to new_warehouse_path, notice: "Please properly fill in all fields."
    end
  end

  private

  def warehouse_params
    params.permit(:name, :location)
  end
end
