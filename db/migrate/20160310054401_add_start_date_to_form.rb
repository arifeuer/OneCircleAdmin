class AddStartDateToForm < ActiveRecord::Migration
  def change
    add_column :forms, :start_date, :string
  end
end
