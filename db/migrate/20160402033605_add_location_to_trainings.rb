class AddLocationToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :location, :string
  end
end
