# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Trainings.create!({training_title => 'Springfield Public Schools'}, {training_type: 'Initial Training'}, {location: 'San Rafael, CA 94901'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-04-06 00:00:00'}, {course_end_date: '2006-04-07 00:00:00'}])
# Trainings.create!([{training_title: 'Brightside Inc.'}, {training_type: 'Initial Training'}, {location: 'Hartford, CT 06067'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-02-23 00:00:00'}, {course_end_date: '2006-02-24 00:00:00'}])
# Trainings.create!([{training_title: 'Andover High School'}, {training_type: 'Advanced Training'}, {location: 'Anchorage, AK 99501'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-02-27 00:00:00'}, {course_end_date: '2006-02-28 00:00:00'}])
# Trainings.create!([{training_title: 'Lynn DYS'}, {training_type: 'GC/BC Workshop'}, {location: 'Eau Claire, WI 54701'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-03-08 00:00:00'}, {course_end_date: '2006-03-09 00:00:00'}])
# Trainings.create!([{training_title: 'Women Express/Teen Voices'}, {training_type: 'Mother-Daughter Training'}, {location: 'Los Angeles, CA 91350'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-03-30 00:00:00'}, {course_end_date: '2006-03-31 00:00:00'}])
# Trainings.create!([{training_title: 'Mission Hill Community Center'}, {training_type: 'MODA Training'}, {location: 'Honolulu, HI 96811'},  {certification_number: 'aaaaaa'}, {course_start_date: '2006-04-19 00:00:00'}, {course_end_date: '2006-04-20 00:00:00'}])


trainings = [{:training_title => 'Springfield Public Schools', :training_type => 'STC', :trainer => 'Alex Sung',  :location => 'San Rafael, CA 94901',  :certification_number => 'aaaaaa', :course_start_date => '2006-04-06 00:00:00', :course_end_date => '2006-04-07 00:00:00' },
            {:training_title => 'Alex Schools', :training_type => 'NASW',:trainer => 'Jay Iyer', :location => 'San Francisco, CA 94901',  :certification_number => 'bbbbbb', :course_start_date => '2006-04-06 00:00:00', :course_end_date => '2006-04-07 00:00:00' }, 
            {:training_title => 'ARUN School for the specially gifted', :training_type => 'CE',:trainer => 'Pingles', :location => 'St. Kishan, CA 94901',  :certification_number => 'nukkajaz', :course_start_date => '2006-04-06 00:00:00', :course_end_date => '2006-04-07 00:00:00' },
            {:training_title => '#####INVALID#####', :training_type => '????',:trainer => 'John Doe', :location => '?????, ??',  :certification_number => '?????', :course_start_date => '1970-01-01 00:00:00', :course_end_date => '1970-01-02 00:00:00'} 
] 
            
trainings.each do |training|
    Trainings.create!(training)
end 

user = User.new
user.id = 1
user.email = "ocfadmin@berkeley.edu"
user.encrypted_password = "$2a$10$rYUBmWYACiFaN.jvpd6ZiuVZvGLUYQEknVahWsc9Hkj4R4jJMbTZe"
user.reset_password_token = "41e8c7d644fdec82513e022c487d5a80bd132377341311312449ac44eb609e54"
user.reset_password_sent_at = "2016-04-28 10:29:12"
user.remember_created_at = nil
user.sign_in_count = 0
user.current_sign_in_at = nil
user.last_sign_in_at = nil
user.current_sign_in_ip = nil
user.last_sign_in_ip = nil
user.created_at =  "2016-04-15 09:04:32"
user.updated_at = "2016-04-28 19:40:37"
user.admin = true
user.save!



connection = ActiveRecord::Base.connection

# - IMPORTANT: SEED DATA ONLY
# - DO NOT EXPORT TABLE STRUCTURES
# - DO NOT EXPORT DATA FROM `schema_migrations`
sql = File.read('db/data_records.sql')
statements = sql.split(/;$/)
statements.pop  # the last empty statement

ActiveRecord::Base.transaction do
	statements.each do |statement|
	  # print(statement)
	  connection.execute(statement)
	end
end
# unless Rails.env.production?
#   connection = ActiveRecord::Base.connection
#   connection.tables.each do |table|
#     connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
#   end

#   sql = File.read('db/tblContact.sql')
#   statements = sql.split(/;$/)
#   statements.pop

#   ActiveRecord::Base.transaction do
#     statements.each do |statement|
#       connection.execute(statement)
#     end
#   end
# end
