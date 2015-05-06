@user-index
Feature: User destoried
  As an administrator
  You can see the list of all users and can choose to delete a user
  In order to remove obsolete user

#  @javascript
  Scenario: The user does not have permission to destory a user
    Given I has signed in
    When  I click the "Users" link
    Then  I should see the message contains "All users"
    And   I should see the message contains "Person"
    And   I should not see the link "delete"
  
#  @javascript
  Scenario: Administrator destory user successfully
    Given I has signed in as an administrator
    When  I click the "Users" link
    Then  I should see the message contains "All users"
    And   I should see the message contains "Person"
    And   I should see a "delete" link