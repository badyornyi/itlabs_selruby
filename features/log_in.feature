Feature: Log in
  As a User
  I want to be able
  to log in to the app

  Background: on Login page
    Given on Log in page

  @pre_implemented @page_objected @log_in
  Scenario: 1. Positive log in
    When I submit user: last_test_user/last_test_user
    Then I am logged in

  @pre_implemented @page_objected @log_in
  Scenario Outline: 2. Negative cases
    When I submit user: <login>/<password>
    Then I see error message
    Examples:
      | login          | password |
      |                |          |
      | last_test_user |          |
      | last_test_user | qwerqwer |