class AddStcFieldRepresentativeToForm < ActiveRecord::Migration
  def change
    add_column :forms, :stcOfield_representative, :string
  end
end
