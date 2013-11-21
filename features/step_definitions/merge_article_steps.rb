

# Treat two args that should both be found in a page
Then /^I should see "(.?)" and "(.?)"$/ do |arg1, arg2|
  if arg1 == arg2
    assert page.body.count(arg1) > 1
   else
    first = page.body.index(arg1)
    assert first > 0
    second = page.body.rindex(arg2)
    assert second != first && second > (first + arg1.length) 
  end
end

Given /^the following articles exist/ do |article_table|
  Article.create!(article_table.hashes)
end

Given /^the following comments exist/ do |comment_table|
  Comment.create!(comment_table.hashes)
end

When /^I log out/ do
  visit '/accounts/logout/'
end
