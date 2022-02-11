class BooksController < ApplicationController
    before_action :get_book_type

    def index
        @books = Book.paginate page: params[:page]
    end

    private

        def get_book_type
            # @book_types= BookType.all.to_h{|b| [b.name, b.id]}
            @book_types = BookType.all.map{|b| [b.name, b.id]}.to_h
        end

end

