Feature: User registration
  As a User
  I want to be able
  to register

  @pre_implemented @page_objected
  Scenario: 1. Positive registration
    Given on Registration page
    When I submit registration form with valid data
    Then I see success message
    And  I am logged in