Feature: generate a table of trainings

  As an office administrator
  I want to have a table of all trainings
  So that I can generate forms from the table 

Background: training in database
  
  # Given the following trainings exist:   --> this line is unncessary for the first MVP since we do not have 
  # a list of trainings on the home page. Insteaf we are creating a new training by completing the form -Kishan


Scenario: Generate table
  #enter steps(s) to begin process
  When I am on the home page
  Then I must be on the page with the title: "Training Table" 
  #enter step(s) to check if the correct input fields are available
  Then I should see "Training Type"
  And I should see "Certification Number"
  And I should see "Start Date"
  And I should see "End Date"
  And I should see "Training Location"
  And I should see "Trainer"
  And I should see "Forms"
  And I should see "Generate"
  
  When I follow "Generate 1"
  Then I must be on the page with the title: "Generate STC Sign In Sheet"
  
  When I go to the home page
  When I follow "Generate 2"
  Then I must be on the page with the title: "Generate STC Sign In Sheet"
  
  When I go to the home page
  When I follow "Generate 3"
  Then I must be on the page with the title: "Generate STC Sign In Sheet"