class RemoveDateFromTraining < ActiveRecord::Migration
  def change
    remove_column :trainings, :date, :string
  end
end
