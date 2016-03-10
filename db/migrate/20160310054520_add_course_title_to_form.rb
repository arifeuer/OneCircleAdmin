class AddCourseTitleToForm < ActiveRecord::Migration
  def change
    add_column :forms, :course_title, :string
  end
end
