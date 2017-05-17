Feature: Log out
  As a User
  I want to be able
  to log out of the app

  Background: on Login page
    Given on Registration page
    And  I submit registration form with valid data

  Scenario: 1. Log out right after registration
    When I click Logout button
    Then I see main page with Login button

  Scenario: 2. Log out after login
    And  I click Logout button
    And  I submit login form with valid data
    When I open User Account page
    And  I click Logout button
    Then I see main page with Login button