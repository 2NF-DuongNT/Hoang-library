class BookCardsController < ApplicationController
    before_action :get_book_type, only: :show
    before_action :find_book_card, only: :show
    

    def new
        @book_card = BookCard.new
    end

    def show
        @borrowed_books = BorrowedBook.where(book_card_id: params[:id])
    end
    
    private

        def find_book_card
            @book_card = BookCard.find_by id: params[:id]
            if @book_card.nil?
                flash[:danger] = t("book_cards.flash_find_error")
                redirect_to employees_book_cards_path
            end
        end

        def get_book_type
            @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
        end 
end
