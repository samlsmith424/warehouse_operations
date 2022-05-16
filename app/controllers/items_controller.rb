class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new

  end

  def create
    item = Item.new(params.permit(:name, :description, :price))
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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path(item), notice: "Update was successfull."
    else
      redirect_to edit_item_path(item), notice: "Unable to update item, please try again"
    end
  end

  def destroy
    Item.destroy(params[:id])
    redirect_to items_path, notice: "Item successfully deleted."
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
    # params.permit(:name, :description, :price)
  end
end
