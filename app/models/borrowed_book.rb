class BorrowedBook < ApplicationRecord
    belongs_to :book
    belongs_to :book_card
    accepts_nested_attributes_for :book, :book_card, allow_destroy: true
    after_save :change_status_book

    validate :check_book_status

    private

        def check_book_status
            unless self.book.available?
                errors.add :book_unavailable, "book unavailable"
            end
        end

        def change_status_book
            self.book.update(status: 1)
        end

end
