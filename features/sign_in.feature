Feature: Sign in with email

  Scenario: User signs in successfully with email
    Given I am signed up as "user@example.com"
    When I go to the sign in page
    And I sign in as "user@example.com"
    Then I should be signed in
