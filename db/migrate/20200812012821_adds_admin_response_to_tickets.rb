class AddsAdminResponseToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :admin_response, :string
  end
end
