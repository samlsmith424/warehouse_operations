class WarehousesController < ApplicationController
  before_action :find_warehouse_id, only: [:show, :update]

  def index
    @warehouses = Warehouse.all
  end

  def show; end

  def create
    warehouse = Warehouse.new(warehouse_params)
    if warehouse.save
      redirect_to warehouses_path, notice: "Warehouse successfully created"
    else
      redirect_to new_warehouse_path, notice: "Please properly fill in all fields."
    end
  end

  def update
    item = Item.find_by(id: params[:items].to_i)
    @warehouse.add_item(item)
    redirect_to warehouse_path(@warehouse)
  end

  private

  def warehouse_params
    params.permit(:name, :location)
  end

  def find_warehouse_id
    @warehouse = Warehouse.find(params[:id])
  end
end
