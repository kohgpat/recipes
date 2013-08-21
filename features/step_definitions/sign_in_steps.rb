When /^I go to the sign in page$/ do
  visit sign_in_path
end

When /^I sign in as "(.*?)"$/ do |email|
  steps %{
    When I go to the sign in page
    And I fill in "Email" with "#{email}"
    And I fill in "Password" with "password"
    And I press "Sign in"
  }
end
