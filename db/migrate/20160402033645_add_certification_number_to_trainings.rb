class AddCertificationNumberToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :certification_number, :string
  end
end
