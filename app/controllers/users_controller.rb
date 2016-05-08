class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    if @users.count > 1
      grouped_users = @users.each_slice( (@users.count/2.0).round ).to_a
      @first_grouped_users = grouped_users.first
      @second_grouped_users = grouped_users.last
    else
      @first_grouped_users = @users
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @item = Item.new
    end
  end
end
