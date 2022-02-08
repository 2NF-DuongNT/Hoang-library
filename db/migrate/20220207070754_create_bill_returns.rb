class CreateBillReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :bill_returns do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :employee
      t.float :rent
      t.float :fine
      t.integer :borrowed_date
      t.float :total

      t.timestamps
    end
  end
end
