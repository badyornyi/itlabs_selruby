Feature: Project
  As a User
  I want to be able
  to create project
  and to work with it

  Background: on Projects page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Projects page

  @pre_implemented @page_objected @project
  Scenario: 1. Create new project
    When I open New Project creation form
    And  I submit Project Creation form with valid data
    Then I see success message
    And  I see created project in Projects List

  @pre_implemented @page_objected @project @member
  Scenario Outline: 2. Add user to project
    When I create new project
    And I open Members project tab
    And I add user last_test_user to the project with role <role_name>
    Then I see user last_test_user in the members list
    Examples:
      | role_name |
      | Manager   |
      | Developer |
      | Reporter  |

  @pre_implemented
  Scenario: 3. Edit user role
    When I create new project
    And  I open Members project tab
    And  I add user last_test_user to the project with role Manager
    And  I change user last_test_user role to Developer
    Then I see user last_test_user in the members list with role Developer

  @pre_implemented @page_objected @project @version
  Scenario: 4. Create project version
    When I create new project
    And  I open Versions project tab
    And  I submit Project Version Creation form with valid data
    Then I see success message