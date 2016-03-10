class AddCertificationNumberToForm < ActiveRecord::Migration
  def change
    add_column :forms, :certification_number, :string
  end
end
