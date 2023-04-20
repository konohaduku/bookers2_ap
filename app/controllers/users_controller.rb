class UsersController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user.id
  end
  
  def show
    @user=User.find(params[:id])
    @books = @user.books
    @users = User.all
    @user = User.new
    @books = Book.all
    @book = Book.new
  end

  def edit
    @user=User.find(params[:id])
    
  end
   private
  def user_params
    params.require(:user).permit(:name)
  end
end
