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

When /^I go to the password reset request page$/ do
  visit new_password_path
end

Then /^a password reset message should be sent to "(.*)"$/ do |email|
  user = User.find_by_email(email)
  expect(user.confirmation_token).not_to be_blank
end

When /^I follow the password reset link sent to "(.*)"$/ do |email|
  user = User.find_by_email(email)
  visit edit_user_password_path(user_id: user,
                                token: user.confirmation_token)
end

When /^I update my password with "(.*)"$/ do |password|
  steps %{
    When I fill in "Choose password" with "#{password}"
    And I press "Save this password"
  }
end
