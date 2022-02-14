class Book < ApplicationRecord
    has_many :book_cards
    has_many :bill_returns
    belongs_to :book_type

    enum status: [:available, :loaned, :lost]

    validates :name, presence: true
    validates :author, presence: true
    validates :publisher, presence: true
    validates :price, presence: true, numericality: {greater_than: 0, only_float: true}
    validates :status, presence: true
end
