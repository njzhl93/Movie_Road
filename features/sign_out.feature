Feature: Sign out
  As a user has signed in
  You can Sign out form the system
  In order to prevent others impersonate use 

  Background:
    Given I has signed in

#  @javascript
  Scenario: Successful sign out
    When I click the "Account" link
    And I click the "Sign out" link
    Then I should see a "Sign in" link