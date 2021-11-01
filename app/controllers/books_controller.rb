class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id =current_user.id
    if @book.save
    redirect_to books_path
    else
    render :new
    end

  end

  def index
    @book =Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
def books_params
  params.require(:books).permit(:title,:opinion)
end


end
