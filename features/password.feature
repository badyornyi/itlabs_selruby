Feature: User password
  As a User
  I want to be able
  to change my password

  Background: on Change Password page
    Given on Registration page
    And   I submit registration form with valid data
    And   I open Change Password page

  @pre_implemented
  Scenario: 1. Password change
    When I input my old password
    And  I input my new password
    And  I submit password change
    Then I see message "Пароль успешно обновлён."