class AddLocationToForm < ActiveRecord::Migration
  def change
    add_column :forms, :location, :string
  end
end
