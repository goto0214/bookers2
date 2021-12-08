class BooksController < ApplicationController
  before_action :baria_user, only: [:edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).reverse_order
    @create = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end



  def show
    @create = Book.new
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end




  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end


end
