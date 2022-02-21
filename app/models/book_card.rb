class BookCard < ApplicationRecord
    belongs_to :client
    belongs_to :employee
    has_many :borrowed_books, dependent: :destroy
    accepts_nested_attributes_for :borrowed_books, 
        reject_if: proc { |attributes| attributes[:book_id].blank? },
        allow_destroy: true

    enum status: [:unpaid, :paid]

    validates :status, presence: true
    validates :return_date, presence: true
    validates :borrowed_books, presence: true
end

