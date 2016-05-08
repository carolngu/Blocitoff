class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @item = Item.new
    end
  end
end
