Feature: Password reset with email

  Scenario: User is signed up and updates his password
    Given I signed up with "user@example.com"
    When I go to the password reset request page
    And I fill in "Email address" with "user@example.com"
    And I press "Reset password"
    Then a password reset message should be sent to "user@example.com"
    When I follow the password reset link sent to "user@example.com"
    And I update my password with "newpassword"
