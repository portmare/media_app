# /app/controllers/users_controller.rb

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Welcome!'
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
