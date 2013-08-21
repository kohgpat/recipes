Feature: Sign up
  
  Scenario: User signs up with no email
    When I go to the sign up page
    And I fill in "Password" with "password"
    And I press "Sign up"
    Then I should be signed out

  Scenario: User signs up with no password
    When I go to the sign up page
    And I fill in "Email" with "user@example.com"
    And I press "Sign up"
    Then I should be signed out

  Scenario: User signs up with invalid email
    When I go to the sign up page
    And I fill in "Email" with "asd.com"
    And I fill in "Password" with "password"
    And I press "Sign up"
    Then I should be signed out

  Scenario: User signs up with registered email
    Given I am signed up as "user@example.com"
    When I go to the sign up page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Sign up"
    Then I should be signed out

  Scenario: User signs up with valid data
    When I go to the sign up page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I press "Sign up"
    Then I should be signed in
