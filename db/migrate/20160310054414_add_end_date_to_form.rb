class AddEndDateToForm < ActiveRecord::Migration
  def change
    add_column :forms, :end_date, :string
  end
end
