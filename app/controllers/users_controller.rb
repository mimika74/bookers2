class UsersController < ApplicationController

  def new
    @user = User.new
    @book = Book.new
  end

  def show

    @user = User.find(params[:id])
    @book = Book.new
    @books = @users
    @books = @user.books.page(params[:page]).reverse_order

  end

 def index

   @users = User.all

    @books = @users



 end

  def edit

    @user = User.find(params[:id])
    @user = current_user.id
  end

  def update
    @users = User.find(params[:id])

    @users.update(user_params)
    redirect_to user_path(@user.id)
  end


private

def user_params
  params.require(:user).permit(:name, :profile_image)
end

end
