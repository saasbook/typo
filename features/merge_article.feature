Feature: Write Articles
  is a blog administrator
  In order to share my thoughts with the world
  I want to be able to add articles to my blog

  Background:
  Given the blog is set up
  And the following articles exist
  |title   |body           |id |published|state     |allow_comments |
  |Foo     |Lorem Ipsum    |2  |true     |published |t              |
  |Bar     |Dolor sit      |3  |true     |published |t              |
  |Baz     |Aenean massa   |4  |true     |published |t              |

  And the following comments exist:
  |id |article_id |body               |title        |author         |
  |2  |3          |bar1 comment       |bar1 title   |bar1 commentor |
  |3  |4          |bar2 comment       |bar2 title   |bar2 commentor |
  |4  |4          |baz comment        |baz title    |baz commentor  |

  And I am logged into the admin panel
  And I am on the admin content page 

  Scenario: Merge should be available to admin
    When I follow "Foo"
    Then I should be on the view page for "Foo"
    And  I should see "Lorem Ipsum"
    And  I should see "Merge Articles"
    
  Scenario: Merge should not be available on New page
    When I am on the new article page
    Then I should not see "Merge"

  Scenario: Merge should copy old Article and comments to current Article
    When I am on the view page for "Baz"
    And  I fill in "Article ID" with "3"
    And  I press "Merge"
    Then I should be on the admin content page
    And  I should see "Bar"
    And  I should not see "Baz"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the home page
    Then  I should see "Bar"
    And   I should see "Dolor sit"
    And   I should see "Aenean massa"

  Scenario: A non-admin cannot merge two articles
    Given I am on the admin content page
    When  I log out
    Then  I should not see "Bar"
