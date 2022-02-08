class BillReturn < ApplicationRecord
    belongs_to :employee
    belongs_to :book
    belongs_to :client
end
