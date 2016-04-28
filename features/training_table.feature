Feature: generate a table of trainings

  As an office administrator
  I want to have a table of all trainings
  So that I can generate forms from the table 
  
Background: training in database
  
    Given the following trainings exist:
  | training_title                | training_type  | trainer      | location      | certification_number | course_start_date   | course_end_date      |
  | Springfield Public Schools    | STC            | Jay Iyer     | San Francisco | 12345                | 2006-04-06 00:00:00 | 2006-04-07 00:00:00	|     
  | Miller Public Schools         | NASW           | Alex Sung    | New York      | 67890                | 2006-05-07 00:00:00 | 2006-05-08 00:00:00	|
  | Worchester Charter Schools    | CE             | Arun Pingali | Boston        | aaaaa                | 2006-06-08 00:00:00 | 2006-06-09 00:00:00	|
  | #####INVALID#####             | ????           | John Doe     | ??????        | ?????                | 1970-01-01 00:00:00 | 1970-01-02 00:00:00	|

  # Given the following trainings exist:   --> this line is unncessary for the first MVP since we do not have 
  # a list of trainings on the home page. Insteaf we are creating a new training by completing the form -Kishan


Scenario: Generate table
  #enter steps(s) to begin process
  When I am on the home page
  And I log in
  #Then I must be on the page with the title: "trainings" 
  #enter step(s) to check if the correct input fields are available
  Then I should see "Training Type"
  And I should see "Certification Number"
  And I should see "Start Date"
  And I should see "End Date"
  And I should see "Location"
  And I should see "Trainer"
  #And I should see "Forms"
  And I should see "Generate"
  
Scenario: Check Training Data
  
  When I am on the home page
  And I log in
  Then I should see "Springfield Public Schools"
  And I should see "Miller Public Schools"
  And I should see "Worchester Charter Schools"
  And I should see "#####INVALID#####   "

  
Scenario: Check STC Course_Evaluation Generate
  When I am on the home page
  And I log in
  And I follow Generate on the Training with the Title "Springfield Public Schools"
  And I press "Course_Evaluation"
  Then I should get a download with the filename "STC_Course_Evaluation_Sheet.docx"


Scenario: Check NASW Sign In Generate
  When I am on the home page
  And I log in
  And I follow Generate on the Training with the Title "Miller Public Schools "
  And I press "Sign_In"
  Then I should get a download with the filename "NASW_Sign_In_Sheet.docx"

  
Scenario: Check CE Sign In Generate
  When I am on the home page
  And I log in
  And I follow Generate on the Training with the Title "Worchester Charter Schools"
  And I press "Sign_In"
  Then I should get a download with the filename "CE_Sign_In_Sheet.docx"

  
Scenario: Sad Path (Invalid or ilformated Training)
  When I am on the home page
  And I log in
  And I follow Generate on the Training with the Title "#####INVALID#####"
  And I press "Course_Evaluation"
  Then I should get a download with the filename "????_Course_Evaluation_Sheet.docx"