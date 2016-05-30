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

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.user = current_user

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was completed."
    else
      flash.now[:alert] = "There was an error in completing the item."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
