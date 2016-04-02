# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Training.create([{training_title: 'Springfield Public Schools'}, {training_type: 'Initial Training'}, {location: 'San Rafael, CA 94901'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-04-06 00:00:00'}, {course_end_date: '2006-04-07 00:00:00'}])
Training.create([{training_title: 'Brightside Inc.'}, {training_type: 'Initial Training'}, {location: 'Hartford, CT 06067'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-02-23 00:00:00'}, {course_end_date: '2006-02-24 00:00:00'}])
Training.create([{training_title: 'Andover High School'}, {training_type: 'Advanced Training'}, {location: 'Anchorage, AK 99501'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-02-27 00:00:00'}, {course_end_date: '2006-02-28 00:00:00'}])
Training.create([{training_title: 'Lynn DYS'}, {training_type: 'GC/BC Workshop'}, {location: 'Eau Claire, WI 54701'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-03-08 00:00:00'}, {course_end_date: '2006-03-09 00:00:00'}])
Training.create([{training_title: 'Women Express/Teen Voices'}, {training_type: 'Mother-Daughter Training'}, {location: 'Los Angeles, CA 91350'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-03-30 00:00:00'}, {course_end_date: '2006-03-31 00:00:00'}])
Training.create([{training_title: 'Mission Hill Community Center'}, {training_type: 'MODA Training'}, {location: 'Honolulu, HI 96811'}, {date: ''}, {certification_number: 'aaaaaa'}, {course_start_date: '2006-04-19 00:00:00'}, {course_end_date: '2006-04-20 00:00:00'}])

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
