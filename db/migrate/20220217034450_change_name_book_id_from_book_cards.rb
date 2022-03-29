class ChangeNameBookIdFromBookCards < ActiveRecord::Migration[6.1]
    def change
      remove_column :book_cards, :book_id
    end
end
