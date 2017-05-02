Feature: Log out
  As a User
  I want to be able
  To log out of the app

  Background: on Login page
    Given on Log in page

  Scenario: 1. Log out right after registration
    And  I submit registration form with valid data
    When I click Logout button
    Then I see main page

  Scenario Outline: 2. Log out after login
    And  I submit login form with valid data
    When I open <page_name> page
    And  I click Logout button
    Then I see main page
    Examples:
      | page_name    |
      | Home page    |
      | User page    |
      | Account page |