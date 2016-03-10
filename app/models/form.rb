class Form < ActiveRecord::Base
    attr_accessor :stc_field_representative, :certification_number, :start_date, :end_date, :location, :certified_date, :course_title, :total_participants 
end
