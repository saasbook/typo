Feature: Merge Articles
  As an admin
  In order to organize content
  I want to have the ability to merge two similar articles

  Background: Setup the blog
    Given I am on the setup page
    Then I fill in 'setting_blog_name' with 'Test'
    And I fill in 'setting_email' with 'a@abc.com'
    And I press the 'Save' button

  Scenario: A non-admin cannot merge articles
    Given I am not an admin
    When I attempt to access the edit page for an article
    Then I should be redirected to the login page

  Scenario: The merged article should contain the text of the previous two articles
    Given I am an admin
    Then I should see "Welcome back, admin!"
    And I am on the edit page for an article with id 1
    And I should see a form called 'Merge Articles'
    And I fill in the form for merging articles with the id 3
    And I should see a button called 'Merge'
    And I press the Merge button
    Then I should be on the content page
    And I should see a newly created article
    And the article should contain the content of both articles

  Scenario: The merged article should have one author
    Given I am on the admin content page
    Then I should see the new article
    And I should see the author is admin

  Scenario: Comments on each of the previous articles need to carry over to the merged article
    Given We are on the show page
    And the article id is the id of the merged article
    Then I should see all the comments from the first article
    And I should see all the comments from the second article

  Scenario: The title of the new article should be the title of either one of the merged articles
    Given We are on the show page
    And the article id is the id of the merged article
    Then I should see that the title is the title of the first article or the second article