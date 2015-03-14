Feature: Merge Articles
	As a blog admininstrator
	In order to keep my blog organized
	I want to be able to merge articles on the same topic

	Background:
		Given the blog is set up
		And I am logged into the admin panel
		Then I add the articles "Hello World!" and "Goodbye World!"

	Scenario: Fail to merge due to invalid article id
		Given I am on the edit page for "Hello WOrld!" 
		When I fill in "article_id" with "#$%!#@"
		Then I press "Merge"
		Then I should see the message "Invalid Article ID"

	Scenario: Fail to merge due to wrong article id
		Given I am on the edit page for "Hello WOrld!" 
		When I fill in "article_id" with "99999999"
		Then I press "Merge"
		Then I should see the message "Article ID does not match our records"

	Scenario: Merging 2 articles without failures
		Given I am on the edit page for "Hello WOrld!" 
		When I fill in "article_id" with "2"
		Then I press "Merge"
		Then I should see "Successfully Merged"

	Scenario: Checking merged article to not appear in all article's page
		Given I am on the all articles page
		Then I should not see "Goodbye World!"
		Then I follow show with title "Hello World!"

	Scenario: Checking if merged to single author

	Scenario: Checking if merged to single title

	Scenario: Checking if merged articles appear on same page

	Scenario: Checking if comments appear for merged articles




