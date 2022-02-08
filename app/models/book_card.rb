class BookCard < ApplicationRecord
    belongs_to :client
    belongs_to :book
    belongs_to :employee
end

