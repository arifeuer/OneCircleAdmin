class AddTrainingTypeToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :training_type, :string
  end
end
