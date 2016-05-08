class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item has been added to list."
    else
      flash[:alert] = "There was an error in adding the item. Please try again."
    end
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
