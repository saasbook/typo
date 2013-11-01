Then /I fill in '(.*)' with '(.*)'/ do |field, value|
	fill_in field, :with => value
end

And /I press the '(.*)' button/ do |button|
	click_button button
end

Given /I am not an admin/ do
	visit '/accounts/logout'
end

Given /I am an admin/ do
	visit '/accounts/login'
	
end


When /I attempt to access the edit page for an article/ do
	visit '/admin/content/edit/1'
end

Then /I should be redirected to the login page/ do 
	current_path.should == '/accounts/login'
end

And /I am on the edit page for an article with id (.*)/ do |art_num|
	visit "/admin/content/edit/#{art_num}"
end
