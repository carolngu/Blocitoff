class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.order(:email).page params[:page]
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @item = Item.new
    end
  end
end
