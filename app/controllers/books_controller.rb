# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  title          :string
#  link           :string
#  description    :string
#  author         :string
#  publish_date   :string
#  image          :string
#  book_club_date :string
#

class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update]

  def index
    @books = Book.all.order(book_club_date: :asc).page params[:page]
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully added.' }
        format.json { render :index, status: :created, location: @book }
      else
        format.html { render :index}
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to books_path, notice: 'Book was successfully updated.' }
        format.json { render :index, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
    def book_params
       params[:book].permit(:title, :link, :description, :author, :image, :publish_date, :book_club_date)
    end
end
