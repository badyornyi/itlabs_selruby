Feature: User password
  As a User
  I want to be able
  to change my password

  Background: on Change Password page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Change Password page

  @pre_implemented @page_objected
  Scenario: 1. Password change
    When I change my password
    Then I see success message
    When I am logging out
    And I submit login form with valid data
    Then I am logged in