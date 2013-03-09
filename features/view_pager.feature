Feature: View Page
	In order to test chanages
	As an author
	I want to see the page

 Background:
    Given the blog is set up
    And I am logged into the admin panel
 
   
Scenario: When articles are merged
    I am logged into the admin page
    I follow the All Articles link
    I follow the edit link for article "Merged A" 
    And  I should see the pager
  