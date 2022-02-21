class Employees::BooksController < ApplicationController
    before_action :logged_in_user
    before_action :require_employee
    before_action :get_book_type
    before_action :find_book, only: [:edit, :update, :show, :destroy]
    before_action :find_all_books, only: [:update, :create, :index, :destroy]

    def new
        @book = Book.new
    end

    def create
        @book = Book.new book_params
        if @book.save
            flash[:success] = t(".flash_success")
            redirect_to employees_books_path
        else
            render :new
        end
    end

    def update
        if @book.update book_params
            flash[:success] = t(".flash_update_success")
            redirect_to employees_books_path
        else
            render :edit
        end
    end
    
    def destroy
        @book.destroy
        flash[:success] = t(".flash_delete")
        redirect_to employees_books_path
    end
        
    private


        def book_params
            params.require(:book).permit(:name, :author, :publisher,
                :book_type_id, :price, :status)
        end
          
        def find_book
            @book = Book.find_by id:params[:id]
            if @book.nil?
                flash[:danger] = t("books.fash_find_error")
                render :index
            end
        end
      
        def get_book_type
            @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
        end

        def find_all_books
            @books = Book.paginate page: params[:page]
        end

end
