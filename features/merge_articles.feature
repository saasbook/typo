Feature: Non-Admin can't merge Articles
  As a blog user
  In order to keep articles clean
  I'm not able merge articles

  Background:
    Given the blog is set up
    And there are 2 users set up
    And there "user1" has "Test Page" article created
    And I am logged as non-admin user into the admin panel

  Scenario: Restrict access to merge feature
    Given I am on the edit article "Test Page" page
    Then I should not see "Merge Articles"
