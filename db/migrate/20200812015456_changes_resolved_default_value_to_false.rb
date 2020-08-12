class ChangesResolvedDefaultValueToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tickets, :resolved?, false
  end
end
