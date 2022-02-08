class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :age
      t.string :gender
      t.string :email
      t.string :password_digest
      t.integer :type

      t.timestamps
    end
  end
end
