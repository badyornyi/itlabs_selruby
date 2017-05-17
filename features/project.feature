Feature: Project
  As a User
  I want to be able
  to create project
  and to work with it

  Background: on Projects page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Projects page

  Scenario: 1. Create new project
    When I click New project button
    And  I submit Project Creation form with valid data
    Then I see message "Создание успешно."

  Scenario: 2. Add user to project
    When I create new project
    And  I open Members project tab
    And  I add new user <user_name> to the project
    Then I see user <user_name> in the members list

  Scenario: 3. Edit user role
    When I create new project
    And  I open Members project tab
    And  I add new user <user_name> with role <role_name> to the project
    And  I change user <user_name> role to <role_name>
    Then I see user <user_name> with role <role_name> in the members list

  Scenario: 4. Create project version
    When I create new project
    And  I open Versions project tab
    And  I click New version button
    And  I submit Project Version Creation form with valid data
    Then I see message "Создание успешно."