class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.integer :book_type_id
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
