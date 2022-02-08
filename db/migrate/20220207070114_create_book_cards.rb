class CreateBookCards < ActiveRecord::Migration[6.1]
  def change
    create_table :book_cards do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :employee_id
      t.integer :status
      t.date :return_date

      t.timestamps
    end
  end
end
