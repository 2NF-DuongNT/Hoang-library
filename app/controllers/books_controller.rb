class BooksController < ApplicationController
    before_action :get_book_type
    before_action :find_book, only: :show

    def index
        @books = Book.paginate page: params[:page]
    end

    private

        def get_book_type
            # @book_types= BookType.all.to_h{|b| [b.name, b.id]}
            @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
        end

        def find_book
            @book = Book.find_by id:params[:id]
            if @book.nil?
                flash[:danger] = t("books.fash_find_error")
                render :index
            end
        end

end

