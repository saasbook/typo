Feature: Merge View
	As a blog administrator
	In order to keep my blog organized
	I want to be able to merge articles on the same topic

	Background:
		Given the blog is set up
		And I am logged into the admin panel
		And I add article "Hello World!"


	Scenario: Seeing Merge Articles as an admin
		Given I am on the all articles page
		I should see "Manage Articles"
		When I follow edit with title "Hello World!"
		Then I should see "Merge Articles"



