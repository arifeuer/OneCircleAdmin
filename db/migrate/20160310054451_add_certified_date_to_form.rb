class AddCertifiedDateToForm < ActiveRecord::Migration
  def change
    add_column :forms, :certified_date, :string
  end
end
