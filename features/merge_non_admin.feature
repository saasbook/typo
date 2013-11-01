Feature: Merge Articles
  As an admin
  In order to organize content
  I want to have the ability to merge two similar articles

  Scenario: A non-admin cannot merge articles
    Given I am not an admin
    And I am on the edit page for an article
    Then I should be redirected to the login page