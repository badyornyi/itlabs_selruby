Feature: Log out
  As a User
  I want to be able
  to log out of the app

  Scenario: 1. Log out right after registration
    Given on Registration page
    And  I submit registration form with valid data
    When I click Logout button
    Then I see main page with Login button

  Scenario Outline: 2. Log out after login
    Given on Registration page
    And  I submit registration form with valid data
    And I click Logout button
    And  I submit login form with valid data
    When I open <page_name> page
    And  I click Logout button
    Then I see main page with Login button
    Examples:
      | page_name    |
      | Home page    |
      | User page    |
      | Account page |