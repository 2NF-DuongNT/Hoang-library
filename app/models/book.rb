class Book < ApplicationRecord
    has_many :book_cards
    has_many :bill_returns
    belongs_to :book_type
end
