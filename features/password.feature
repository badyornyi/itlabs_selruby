Feature: User password
  As a User
  I want to be able
  To change my password

  Background: on Change Password page
    Given I submit login form with valid data
    And   I open Change Password page

  Scenario: Password change
    When I input my old password
    And  I input my new password
    And  I submit password change
    Then I see message "Ваша учётная запись активирована. Вы можете войти."