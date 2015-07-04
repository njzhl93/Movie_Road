Feature: Sign in
  As a registered user
  You can log in the system
  so that the movie review

  Background:
    Given I was a registered user 
    And   I click the "Sign in" link

#  @javascript
  Scenario: Successfully browse sign in page
    Then I should see a "Email" field
    Then I should see a "Password" field


#  @javascript
  Scenario Outline: Unsuccessful sign in
    When  I fill in the "Email" field with <Email>
    And  I fill in the "Password" field with <Password>
    And  I click the "Sign in" button
    Then I should see the message contains "Invalid"

    Examples:
      | Email              | Password |
      | "foo@barbaz.com"   | "foobar" |
      | "user@example.com" | "foobee" |

  @javascript
  Scenario: Successful sign in
    When I fill in the "Email" field with "user@example.com"
    And  I fill in the "Password" field with "foobar"
    And  I click the "Sign in" button
    Then I should see a "Account" link
    And  I click the "Account" link
    And  I should see a "Sign out" link