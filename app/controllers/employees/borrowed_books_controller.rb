class Employees::BorrowedBooksController < ApplicationController
    before_action :logged_in_user
    before_action :require_employee
    before_action :get_book_type
    before_action :find_book_card, only: [:index, :new]

    def index
        @borrowed_books = @book_card.borrowed_books.paginate(page: params[:page])
    end
    
    def new
        @borrowed_book = @book_card.borrowed_books.build
    end

    def create
        @borrowed_book = BorrowedBook.new borrowed_book_params
    end

end

private

    def get_book_type
        @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
    end 

    def find_book_card
        @book_card = BookCard.find_by id: params[:book_card_id]
    end
