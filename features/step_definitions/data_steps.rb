When(/^I retrieve all user data$/) do
  get_data
end

When(/^jsonpath "([^"]*)" contains "([^"]*)"$/) do | jsonpath, message |
  assert_jsonpath_contains(jsonpath, message)
end
