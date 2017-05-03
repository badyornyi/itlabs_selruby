Feature: User registration
  As a User
  I want to be able
  to register

  Scenario: Positive registration
    Given on Registration page
    When I submit registration form with valid data
    #Then I see message "Your account has been activated. You can now log in."
    Then I see message "Ваша учётная запись активирована. Вы можете войти."
    And  I am logged in