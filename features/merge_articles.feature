Feature: Merge Articles
	In order to make a blog
	As an author
	I want to manage articles

 Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I as admin have published article "Merged A" with content "Martin..." 
    And I as admin have published article "Merged B" with content "John"
   
   
Scenario: When articles are merged
    I am logged into the admin page
    I follow the All Articles link
    I follow the edit link for article "Merged A" 
    When I fill in "merge_with" with the ID of article "Merged B"
    And  I should see the "Merge" button 
    Then I should see "Merged A" before "Merged B"  
    


