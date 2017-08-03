Feature: Log out
  As a User
  I want to be able
  to log out of the app

  Background: on Login page
    Given on Registration page
    And  I submit registration form with valid data

  @pre_implemented @page_objected @log_out
  Scenario: 1. Log out right after registration
    When I am logging out
    Then I see main page with possibility to log in

  @pre_implemented @page_objected @log_out
  Scenario: 2. Log out after login
    And  I am logging out
    And  I submit login form with valid data
    And  I am logging out
    Then I see main page with possibility to log in