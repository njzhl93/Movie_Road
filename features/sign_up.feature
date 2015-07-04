Feature: Sign up
  As a general user
  You can apply for registration
  To become a movie critic

  Background:
    Given I visit the "signup" page

  #@javascript
  Scenario: Successfully browse sign up page
    Then I should see a "Name" field
    Then I should see a "Email" field
    Then I should see a "Password" field
    Then I should see a "Confirm Password" field

  #@javascript
  Scenario Outline: Name, email and password is invalid values
    When I fill in the "Name" field with <Name>
    And  I fill in the "Email" field with <Email>
    And  I fill in the "Password" field with <Password>
    And  I fill in the "Confirm Password" field with <Confirm Password>
    And  I click the "Create my account" button
    Then I should see the message contains "error"

    Examples:   
      | Name           | Email              | Password | Confirm Password |
      | ""             | "user@example.com" | "foobar" |  "foobar"        |
      | "Example User" | ""                 | "foobar" |  "foobar"        |
      | "Example User" | "user@example.com" | ""       |  ""              |
      | "Example User" | "foo@bar+baz.comm" | "foobar" |  "foobar"        |
      | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"| "user@example.com" | "foobar" |  "foobar"        |
      | "Example User" | "user@example.com" | "fooccc" |  "foobar"        |     

#   @javascript
   Scenario: Successfully sign up
    When I fill in the "Name" field with "Example User"
    And  I fill in the "Email" field with "user@example.com"
    And  I fill in the "Password" field with "foobar"
    And  I fill in the "Confirm Password" field with "foobar"
    And  I click the "Create my account" button
    Then I should see the message contains "Welcome"
    And  I should see a "Sign out" link