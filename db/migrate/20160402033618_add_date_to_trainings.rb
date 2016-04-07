class AddDateToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :date, :string
  end
end
