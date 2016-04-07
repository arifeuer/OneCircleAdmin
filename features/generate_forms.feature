Feature: autofill inputs into form templates

  As an office administrator
  I want to generate forms based on information about the training session
  So that I can save time 

Background: training in database
  
  # Given the following trainings exist:   --> this line is unncessary for the first MVP since we do not have 
  # a list of trainings on the home page. Insteaf we are creating a new training by completing the form -Kishan



Scenario: Generate sign in forms
  #enter steps(s) to begin process
  When I am on the forms page
  And I follow "New Form"
  #Can we test the route here?
  Then I must be on the page with the title: "Generate STC Sign In Sheet" 
  #enter step(s) to check if the correct input fields are available
  Then I should see "STC Field Representative"
  And I should see "Certification Number"
  #Then the "form_certification_number" field should contain "^$"
  And I should see "Start Date"
  And I should see "End Date"
  And I should see "Location"
  And I should see "Certified Date"
  And I should see "Course Title"
  And I should see "Total Participants"


 
#Scenario: Selecting from the Dropdown
  When I select "Girls Circle Facilitator Training" from "Course Title"
  When I select "Girls Circle Facilitator Training" from "Course Title"


Scenario: Valid File 
  Given PENDING:
  #When I press "Choose File"
  Then I upload a valid file
  Then I should receive a valid file

Scenario: Invalid File
  Given PENDING
  #When I press "Choose File"
  Then I upload an invalid file
  Then I should receive an invalid file

Scenario: Generating Form  
  Given  PENDING
  When I press "Generate"
  Then I should get a download with the filename "STC_Sign_In_Sheet.docx"