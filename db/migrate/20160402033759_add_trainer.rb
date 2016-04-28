class AddTrainer < ActiveRecord::Migration
  def change
    add_column :trainings, :trainer, :string
  end
end
