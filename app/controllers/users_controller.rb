class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) # найти в бд юзера с id = 1
  end
end
