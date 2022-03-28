class Employees::BookCardsController < ApplicationController
    before_action :logged_in_user
    before_action :require_employee
    before_action :get_user, only: [:new, :edit]
    before_action :find_book_card, only: [:edit, :destroy, :update]
    before_action :get_book_card_statuses, only: [:new, :edit, :update]

    def index
        @book_cards = BookCard.paginate page: params[:page]
    end

    def new
        @book_card = current_user.book_cards.new
        @book_card.borrowed_books.new
        @books = Book.books_available
    end

    def edit
        @books = Book.all
    end

    def show
        @borrowed_books = BorrowedBook.where(book_card_id: params[:id])
    end

    def create
        @book_card = current_user.book_cards.new book_card_params
        if @book_card.save
            flash[:success] = t(".flash_success")
            redirect_to employees_book_cards_path
        else
            respond_to do |format|
                format.html { redirect_to new_employees_book_card_borrowed_book_path }
                format.js
            end
        end
        
    end

    def update
        if @book_card.update book_card_params
            flash[:success] = t(".flash_update_success")
            redirect_to employees_book_cards_path
        else
            respond_to do |format|
                format.html { redirect_to employees_book_card_path }
                format.js
            end
        end
    end

    def destroy
        @book_card.destroy
        flash[:success] = t(".flash_delete")
        redirect_to employees_book_cards_path
    end

    private

        def book_card_params
            params.require(:book_card).permit(:client_id,
                :book_id, :employee_id, :status, :return_date,
                borrowed_books_attributes: [:id, :book_id, :_destroy]
            )
        end

        def find_book_card
            @book_card = BookCard.find_by id: params[:id]
            if @book_card.nil?
                flash[:danger] = t("book_cards.flash_find_error")
                redirect_to employees_book_cards_path
            end
        end

        def get_user
            @employees = User.employees
            @clients = User.clients
        end

        def get_book_card_statuses
            @statuses = BookCard.statuses.keys
        end

end
