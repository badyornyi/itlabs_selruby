Feature: Project
  As a User
  I want to be able
  to create project
  and to work with it

  Background: on Projects page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Projects page

  @pre_implemented
  Scenario: 1. Create new project
    When I open New Project creation form
    And  I submit Project Creation form with valid data
    Then I see message "Создание успешно."

  @pre_implemented
  Scenario: 2. Add user to project
    When I create new project
    And  I open Members project tab
    And  I add user last_test_user to the project
    Then I see user last_test_user in the members list

  @pre_implemented
  Scenario: 3. Edit user role
    When I create new project
    And  I open Members project tab
    And  I add user last_test_user to the project with role Manager
    And  I change user last_test_user role to Developer
    Then I see user last_test_user in the members list with role Developer

  @pre_implemented
  Scenario: 4. Create project version
    When I create new project
    And  I open Versions project tab
    And  I open New Project Version creation form
    And  I submit Project Version Creation form with valid data
    Then I see message "Создание успешно."