Feature: Merge Articles
  As a blog admin user
  In order to keep articles clean
  I can merge articles

  Background:
    Given the blog is set up
    And there are 2 users set up
    And "user1" has "Test Page" article created
    And "user2" has "Test Page 2" article created

  Scenario: Restrict access to merge feature for non-admin user
    Given I am logged as "user1" with "111111"
    And I am on the edit article "Test Page" page
    Then I should not see "Merge Articles"

  Scenario: Admin user can accesss the merge feature
    Given I am logged as "admin" with "aaaaaa"
    And I am on the edit article "Test Page" page
    Then I should see "Merge Articles"
