class UsersController < ApplicationController

  def new
    @user = User.new
    @book = Book.new
  end

  def show

    @user = User.find(params[:id])
    @book = Book.new


    @books = @user.books.page(params[:page]).reverse_order


  end

 def index

    #@user = User.find(:current_user.id)
    @users = User.all

    @books = @users



 end

  def edit

    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to users_path
    end

  end

  def update

    flash[:notice]="You have updated user successfully."
    @user = User.find(params[:id])

    @user.update(user_params)
    redirect_to user_path(@user.id)
  end




private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction_id, :current_user)
end

end
