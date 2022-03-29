class AddDefaultStatusBookCards < ActiveRecord::Migration[6.1]
    def change
      change_column :book_cards, :status, :integer, default: 0
    end
end
