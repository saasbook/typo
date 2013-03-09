
Given /^I as (.*) have published article "([^"]*)" with content "([^"]*)"$/ do |author,title,content|
  user_id = User.find_by_name(author).id
  Article.create!(:title => title,:body => content, :allow_comments => true, :allow_pings => true, :author => author, :user_id => user_id, :permalink => "hello-world", :post_type => "read", :published => true, :published_at => "2012-06-09 21:51:55 UTC", :settings => {"password"=>nil}, :state => "published", :text_filter_id => 5, :type => "Article")
end

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
  visit "/admin/content/"
end

And /^I follow the Edit link for article "([^"]*)"$/ do |title|
  id = Article.find_by_title(title).id
  visit "/admin/content/edit/#{id}"
end


And /^I fill in "([^"]*)" with the ID of article "([^"]*)"$/ do  |field,title|
  id = Article.find_by_title(title).id
  
end

And /^I should see the "([^"]*)" button$/ do |label|
 text = %Q{value="#{label}"}
end

Then /^I should see "(.*)" before "(.*)"/ do |text1, text2|
  content = page.body.inspect
end
 

