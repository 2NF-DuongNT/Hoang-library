class BookCardsController < ApplicationController
    before_action :find_user_and_book, only: :index

    def new
        @book_card = BookCard.new
    end

    def index
        @book_cards = BookCard.paginate page: params[:page]
    end
    
    private

        def book_card_params
            params.require(:book_card).permit(:user_id,
                :employee_id, :status, :return_date)
        end

        def find_book_card
            @book_card
        end

        def find_user_and_book
            @books = Book.all
            @users = User.all
        end
end
