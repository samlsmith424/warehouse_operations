class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to items_path
    else
      redirect_to new_item_path, notice: "Please properly fill in all fields."
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    # params.require(:item).permit(:name, :description, :price)
    params.permit(:name, :description, :price)
  end
end
