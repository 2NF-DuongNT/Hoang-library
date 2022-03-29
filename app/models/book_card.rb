class BookCard < ApplicationRecord
    belongs_to :client
    belongs_to :employee
    has_many :borrowed_books, dependent: :destroy
    accepts_nested_attributes_for :borrowed_books, 
        reject_if: :borrowed_book_uniqueness,
        allow_destroy: true

    enum status: [:unpaid, :paid]

    validates :status, presence: true
    validates :return_date, presence: true
    validates :borrowed_books, presence: true
    validate :borrowed_book_uniqueness

    private

        def borrowed_book_uniqueness
            if duplicate_book_hash = self.borrowed_books.group_by(&:book_id).values.detect{|arr| arr.size > 1}
                errors.add :borrowed_book, "is duplicate"
            end
        end

end
