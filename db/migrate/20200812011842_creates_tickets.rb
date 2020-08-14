class CreatesTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :content
      t.integer :customer_id
      t.integer :admin_id
      t.boolean :resolved?
      t.string :admin_response
      t.timestamps
    end 

    add_foreign_key :tickets, :users, column: :customer_id, primary_key: :id
    add_foreign_key :tickets, :users, column: :admin_id, primary_key: :id
  end
end
