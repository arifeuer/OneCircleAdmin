class AddCourseEndDateToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :course_end_date, :string
  end
end
