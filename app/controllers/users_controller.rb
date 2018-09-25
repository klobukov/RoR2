class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) # найти в бд юзера с id = 1
  end

  def create
    @user = User.new(user_params)    # Не окончательная реализация!
    if @user.save
      flash[:success] = "Welcome to the Sample App!" # добавить к flash сообщениям . вывод их в application.html.erb
      redirect_to @user # перенаправит на /users/:id
    else
      render 'new'
    end
  end

  private 

  def user_params
    # параметр user делаем обязательным, а остальные - разрешаем
    # делается для того, чтоб с помощью например curl
    # нельзя было передать левые параметры, которые бы попали в бд
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
