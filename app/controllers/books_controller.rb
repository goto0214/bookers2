class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
    @create = Book.new
  end

  def show
    @create = Book.new
    @book = Book.find(params[:id])

  end

  def edit
  end

  def destroy
  end


  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
