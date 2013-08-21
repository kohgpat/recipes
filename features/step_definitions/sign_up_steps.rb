When /^I go to the sign up page$/ do
  visit sign_up_path
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

Then /^I should be signed in$/ do
  steps %{
    Then I should see "Sign out"
  }
end

Then /^I should be signed out$/ do
  steps %{
    Then I should see "Sign in"
  }
end

Given /^(?:I am|I have|I) signed up (?:as|with) "(.*)"$/ do |email|
  @me = create(:user, :email => email)
end
