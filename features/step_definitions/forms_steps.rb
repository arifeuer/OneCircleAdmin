require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))



Given /the following trainings exist/ do |trainings_table|
  trainings_table.hashes.each do |training|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    training = Trainings.create(training_title: training['training_title'], training_type: training['training_type'], trainer: training['trainer'], location: training['location'], certification_number: training['certification_number'], course_start_date: training['course_start_date'], course_end_date: training['course_end_date'])
    training.save
  end
end

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When(/^I follow Generate on the Training with the Title "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Generate")
end

# When /^I upload a valid file$/ do
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'good-file.csv'))
#   click_button "Send file"
# end


# When /^I upload an invalid file$/ do
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'bad-file.csv'))
#   click_button "Send file"
# end

When(/^I upload a valid file$/) do
  page.attach_file("Choose File", 'features/upload-files/good-file.csv')
end


When(/^I upload an invalid file$/) do
  page.attach_file("Choose File", 'features/upload-files/bad-file.csv')
end

# When /^I upload an invalid file$/ do
#   attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'bad-file.csv'))
#   click_button "Send file"
# end

# Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
#       page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
#     end


Then /^I should receive a valid file "([^\"]*)"$/ do |filename|
  filename.should have_content("STC Field Representative")
  filename.should have_content("Certification Number")
  filename.should have_content("Start Date")
  filename.should have_content("End Date")
  filename.should have_content("Location")
  filename.should have_content("Certified Date")
  filename.should have_content("Course Title")
  filename.should have_content("Total Participants")
end

Then /^I should receive an invalid file$/ do |filename|
  filename.should have_no_content("STC Field Representative")
  filename.should have_no_content("Certification Number")
  filename.should have_no_content("Start Date")
  filename.should have_no_content("End Date")
  filename.should have_no_content("Location")
  filename.should have_no_content("Certified Date")
  filename.should have_no_content("Course Title")
  filename.should have_no_content("Total Participants")
end

Then /^the "([^\"]*)" field should( not)? be empty$/ do |field, negate|
  expectation = negate ? :should_not : :should
  field_labeled(field).value.send(expectation, be_blank)
end

Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
    page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end

When /^I log in$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "login"
end

When /^I logout$/ do 
  click_link "logout"
end