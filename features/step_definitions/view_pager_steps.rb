And /^I am logged into the admin page$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end


And /^I follow the All Articles link$/ do
  visit "/admin/content/edit"
end


And /^I follow the Edit link for article "([^"]*)"$/ do |title|
  id = Article.find_by_title(title).id
  visit "/admin/content/edit/#{id}"
end
	
And /^I should see the pager$/ do 
	save_and_open_page
	
end