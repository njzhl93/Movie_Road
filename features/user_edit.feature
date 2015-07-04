Feature: User edit
  As a user who has logged on to the system
  You can change your own registration information 
  In order to reflect their own latest status

  Background:
    Given I has signed in
    When I click the "Account" link
    And  I click the "Settings" link

  Scenario: Successfully browse user edit page
    Then I should see a "Name" field
    And  I should see a "Email" field
    And  I should see a "Password" field
    And  I should see a "Confirm Password" field
    And  I should see a "change" link

#  @javascript
  Scenario Outline: Name, email and password is invalid values
    When I fill in the "Name" field with <Name>
    And  I fill in the "Email" field with <Email>
    And  I fill in the "Password" field with <Password>
    And  I fill in the "Confirm Password" field with <Confirm Password>
    And  I click the "Save changes" button
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
   Scenario: Successfully edit
    When I fill in the "Name" field with "New Name"
    And  I fill in the "Email" field with "new@example.com"
    And  I fill in the "Password" field with "fnnbar"
    And  I fill in the "Confirm Password" field with "fnnbar"
    And  I click the "Save changes" button
    Then I should see the message contains "Profile updated"
    And  I should see a "Sign out" link