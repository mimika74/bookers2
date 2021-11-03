class UsersController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @users
  end


  def edit
    @books = Books.find(params[:id])
  end

  def update
    @books = User.find(params[:id])
    @books.update(user_params)
    redirect_to user_path(@user.id)
  end


private

def user_params
  params.require(:user).permit(:name, :profile_image)
end

end
