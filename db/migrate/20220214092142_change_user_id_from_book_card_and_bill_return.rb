class ChangeUserIdFromBookCardAndBillReturn < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_cards, :user_id, :client_id
    rename_column :bill_returns, :user_id, :client_id
  end
end
