class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @create = Book.new
  end

  def index
  end

  def edit
  end

  def update
  end
end
