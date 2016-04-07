class AddCourseStartDateToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :course_start_date, :string
  end
end
