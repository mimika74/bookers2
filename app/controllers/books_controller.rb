class BooksController < ApplicationController

  def new
    flash[:notice] ="You have created book successfully."
    @book = Book.new
  end

  def create


    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
    flash[:notice] ="You have created book successfully."
    @book = Book.new
    redirect_to book_path(@book.id)
    else
    @user = current_user
    @books =Book.all
    render :index
    end

  end

  def index

    @user = current_user
    @books =Book.all
    @book = Book.new

  end

  def show


    @book = Book.find(params[:id])
    @user = @book.user


    @books = @user.books.page(params[:page]).reverse_order

  end

  def edit
     @book = Book.find(params[:id])
     @user = @book.user
     if @book.user == current_user
       render "edit"
     else
       redirect_to books_path
     end

  end

  def update
    flash[:notice] ="You have updated book successfully."
    @book = Book.find(params[:id])

    @book.update(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"

  end

private
def book_params
  params.require(:book).permit(:title, :body, :profile_image, :introduction)
end


end
