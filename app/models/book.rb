class Book < ApplicationRecord
    has_many :borrowed_books
    has_many :bill_returns
    belongs_to :book_type

    accepts_nested_attributes_for :borrowed_books, allow_destroy: true

    enum status: [:available, :loaned, :lost]

    validates :name, presence: true
    validates :author, presence: true
    validates :publisher, presence: true
    validates :price, presence: true, numericality: {greater_than: 0, only_float: true}
    validates :status, presence: true

    scope :books_available, ->{where(status: 0)}

end
