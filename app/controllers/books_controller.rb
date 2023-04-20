class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = User.new
  end
  
   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
   end

  def show
     @books = Book.all
     @book = Book.new
     @users = User.all
    @user = User.new
    @book = Book.find(params[:id])
    
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def destroy
    @book = book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def update
    @book = book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(@book.id)  
  end

  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
