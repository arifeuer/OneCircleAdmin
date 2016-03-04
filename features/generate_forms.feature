Feature: autofill inputs into form templates

  As an office administrator
  I want to generate forms based on information about the training session
  So that I can save time 

Background: training in database

  Given the following trainings exist:
  

Scenario: Generate sign in forms
  Given I am on the home page
  And  I follow "Generate forms for Training XXXXX"
  And  I press "Generate sign-in forms"
  Then the "sign-in" forms should start downloading
  And the "sign-in" forms should contain the information specified by "Training XXXXX"