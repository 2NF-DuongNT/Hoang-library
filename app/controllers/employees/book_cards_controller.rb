class Employees::BookCardsController < ApplicationController
    before_action :logged_in_user
    before_action :require_employee
    before_action :get_user, only: [:new]

    def new
        @book_card = current_user.book_cards.new
        @book_card.borrowed_books.new
        @books = Book.available
    end

    def create
        @book_card = current_user.book_cards.new book_card_params
        if @book_card.save
            flash[:success] = t(".flash_success")
            redirect_to root_path
        else
            respond_to do |format|
                format.html { redirect_to new_employees_book_card_borrowed_book_path }
                format.js
            end
        end
    end

    def index
        @book_cards = BookCard.paginate page: params[:page]
    end

    private

        def book_card_params
            params.require(:book_card).permit(:client_id,
                :book_id, :employee_id, :status, :return_date,
                borrowed_books_attributes: [:id, :book_id, :_destroy]
            )
        end

        def get_user
            @employees = User.employees
            @clients = User.clients
        end

        def get_book_card_statuses
            @statuses = BookCard.statuses
        end

end
