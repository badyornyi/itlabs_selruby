Feature: Issues
  As a User
  I want to be able
  to create different types of issues
  and to work with them

  Background: on New Issue page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Projects page
    And   I create new project
    And   I create new project version

  @pre_implemented @page_objected
  Scenario Outline: 1. Create new issue
    When I submit New Issue form with valid data and issue type <issue_type>
    Then I see success message
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |

  @pre_implemented @page_objected
  Scenario Outline: 2. Verify issues visibility on 'Issues' tab
    When I submit New Issue form with valid data and issue type <issue_type>
    And  I open Issues page
    Then I see created issue in the list
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |

  @pre_implemented @page_objected
  Scenario Outline: 3. Start watching issue
    When I submit New Issue form with valid data and issue type <issue_type>
    And  I start to watch issue
    Then I can see that issue is watched
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |