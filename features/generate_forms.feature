Feature: autofill inputs into form templates

  As an office administrator
  I want to generate forms based on information about the training session
  So that I can save time 

Background: training in database
  
  # Given the following trainings exist:   --> this line is unncessary for the first MVP since we do not have 
  # a list of trainings on the home page. Insteaf we are creating a new training by completing the form -Kishan



Scenario: Test Traing Types
  #enter steps(s) to begin process
  When I am on the home page
  Then I should see "Training Types"
  And I should see "STC"
  #Can we test the route here?
  
Scenario: Test Sign in
  When I am on the home page
  And I follow "STC"
  Then I should see "Generate Forms For: STC"
  And I should see "Generate Sign-in Sheet"
  
Scenario: Test data entry
  When I am on the home page
  When I follow "STC"
  And I follow "Generate Sign-in Sheet"
  #enter step(s) to check if the correct input fields are available
  Then I should see "Field Representative"
  And I should see "Certification Number"
  #Then the "form_certification_number" field should contain "^$"
  And I should see "Start Date"
  And I should see "End Date"
  And I should see "Location"
  And I should see "Certified Date"
  And I should see "Course Title"
  And I should see "Total Participants"
  
Scenario: Generate Form
  When I am on the home page
  When I follow "STC"
  When I follow "Generate Sign-in Sheet"
  And I upload a valid file
  Then I should get a download with the filename "dummy.docx"
  
Scenario: Test Back Button for Training
  When I am on the home page
  And I follow "STC"
  And I follow "Back"
  Then I should see "Training Type"
  
Scenario: Test Back Button For STC
  When I am on the home page
  And I follow "STC"
  And I follow "Generate Sign-in Sheet"
  And I follow "Back"
  Then I should see "Generate Forms For: STC"


