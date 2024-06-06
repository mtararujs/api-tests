Feature: Data feature
  Test the functionality for retrival of data for WEB application backend

  Scenario: Retrieve all user data
    When I retrieve all user data
    Then jsonpath "[0].name" contains "John"
