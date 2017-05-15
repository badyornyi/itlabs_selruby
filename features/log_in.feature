Feature: Log in
  As a User
  I want to be able
  to log in to the app

  Background: on Login page
    Given on Log in page

  @pre_implemented
  Scenario: Positive log in
    When I submit user: last_test_user/last_test_user
    Then I am logged in

  @pre_implemented
  Scenario Outline: Negative cases
    When I submit user: <login>/<password>
    Then I see error message: <message>
    Examples:
      | login          | password | message                                  |
      |                |          | Неправильное имя пользователя или пароль |
      | last_test_user |          | Неправильное имя пользователя или пароль |
      | last_test_user | qwerqwer | Неправильное имя пользователя или пароль |
    #Неправильное имя пользователя или пароль
    #Invalid user or password