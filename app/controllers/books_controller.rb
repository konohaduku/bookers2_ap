class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end
  
   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
   end

  def show
     @books = Book.all
     @users = User.all
    @book = Book.find(params[:id])
    @user = @book.user
   
    
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
   @book.destroy
    redirect_to books_path
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)  
  end
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
