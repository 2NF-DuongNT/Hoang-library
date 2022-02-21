class Employees::BookCardsController < ApplicationController
    before_action :logged_in_user
    before_action :require_employee
    before_action :get_book_type, only: :show
    before_action :find_book_card, only: [:show, :edit, :destroy, :update]
    before_action :find_all_book_cards, only: [:index]
    before_action :get_book_card_statuses, only: [:new, :edit, :update]
    before_action :get_book_available

    def new
        @book_card = current_user.book_cards.new
        @book_card.borrowed_books.new
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
            render :new
        end
    end

    def edit

    end

    def update
        if @book_card.update book_card_params
            flash[:success] = t(".flash_update_success")
            redirect_to employees_book_card_path
        else
            render :edit
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

        def find_all_book_cards
            @book_cards = BookCard.paginate page: params[:page]
        end

        def get_book_card_statuses
            @statuses = BookCard.statuses.keys
        end

        def get_book_type
            @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
        end 

        def get_book_available
            @books = Book.where(status: 0)
        end
    

end
