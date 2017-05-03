Feature: Issues
  As a User
  I want to be able
  to create different types of issues
  and to work with them

  Background: on New Issue page
    Given I submit login form with valid data
    And   I open Projects page
    And   I create new project
    And   I create new project version
    And   I open New Issue page

  Scenario Outline: 1. Create new issue
    When I submit New Issue form with valid data and issue type <issue_type>
    Then I see successfully created issue with issue type <issue_type>
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |

  Scenario Outline: 2. Verify issues visibility on 'Issues' tab
    When I submit New Issue form with valid data and issue type <issue_type>
    And  I open Issues page
    Then I see created issue with issue type <issue_type> in the list
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |

  Scenario Outline: 3. Start watching issue
    When I submit New Issue form with valid data and issue type <issue_type>
    And  I click Watch button
    Then I can see that issue is watched
    Examples:
      | issue_type |
      | Bug        |
      | Feature    |
      | Support    |