class User < ApplicationRecord
    has_many :book_cards
    has_many :bill_returns

    enum type: [:Employee, :Client]

    scope :employees, -> {where(type: 0)}
    scope :clients, -> {where(type: 1)}

end
