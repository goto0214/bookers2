class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @create = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
    @user = current_user
    @users = User.page(params[:page]).reverse_order
    @create = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You updated user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
