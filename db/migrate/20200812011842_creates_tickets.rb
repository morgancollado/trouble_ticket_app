class CreatesTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.boolean :resolved?
      t.timestamps
    end 
  end
end
