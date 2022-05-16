class ItemsController < ApplicationController
  before_action :find_item_id, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new; end

  def create
    item = Item.new(params.permit(:name, :description, :price))
    if item.save
      redirect_to items_path
    else
      redirect_to new_item_path, notice: "Please properly fill in all fields."
    end
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "Update was successfull."
    else
      redirect_to edit_item_path(@item), notice: "Unable to update item, please try again"
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item successfully deleted."
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
    # params.permit(:name, :description, :price)
  end

  def find_item_id
    @item = Item.find(params[:id])
  end
end
