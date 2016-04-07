class AddTrainingTitleToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :training_title, :string
  end
end
