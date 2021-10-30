class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = @user.books.page(params[:page]).reverse_order
  end


  def edit
    @books = Books.find(params[:id])
  end



end
