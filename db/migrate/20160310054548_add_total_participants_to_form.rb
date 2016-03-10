class AddTotalParticipantsToForm < ActiveRecord::Migration
  def change
    add_column :forms, :total_participants, :string
  end
end
