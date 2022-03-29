class CreateBorrowedBooks < ActiveRecord::Migration[6.1]
    def change
      create_table :borrowed_books do |t|
        t.integer :book_id
        t.integer :book_card_id
        t.integer :status, default: 0
        t.timestamps
      end
    end
end
