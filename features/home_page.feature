Feature: Home page
  As general user
  You can visits the Home page
  To ask for information and to participate in reviews.

  @javascript
  Scenario: Successfully browse Home page
    When I visit the Home page
    Then I should see a "Sign up now!" link
    And  I should see a "Home" link
    And  I should see a "IMDB" link
    And  I should see a "Movies" link
    And  I should see a "Sign in" link
    And  I should see a "About" link