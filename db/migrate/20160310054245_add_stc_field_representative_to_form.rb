class AddStcFieldRepresentativeToForm < ActiveRecord::Migration
  def change
    add_column :forms, :stc_field_representative, :string
  end
end
