Homework 1: Refactoring and Legacy Code
=======================================

Typo is a blogging engine written in Rails to allow people to set up a blog
easily. Typo consists of about 30,000 lines of code (30 KLOC) and comes with a
ton of features, including authentication to post to the blog, attaching files
to articles, adding special markup, creating custom themes, building user
profiles, and allowing guests and/or users to comment on posts. It also supports
more advanced features like trackbacks (allowing other blogs to "track back" to
yours and mention you in their blog article).

From your perspective, Typo is legacy code since you didn't write it yourself
:-) In this assignment you'll go through the steps of adapting the BDD+TDD cycle
to enhance and fix a bug in a piece of legacy code.

Part 1
------

### Getting set up

In these steps you'll download Typo, get it running on your local system, verify
that its test suite passes, and do a test deployment to Heroku.

*   Install Typo locally
    1.  Fork the Typo repository:
    [github_repo](https://github.com/saasbook/typo) (Typo is open source, but we
    have snapshotted the repo including fixing some failing tests and using a
    stable revision for Ruby 1.9.2)
    2.  Clone your forked Typo repository into a folder on your local machine.
    3.  Run ```bundle install --without production``` in the Typo directory.
    4.  Run the database migration in the Typo directory (```rake db:migrate```)
    5.  Load the seed data into the database (```rake db:seed```)

*   Get the Typo test suite and make sure all specs pass green. Pending specs
    are fine.  Run

        rake spec

    and

        rake cucumber

    in the Typo directory.

*   Make sure Typo can be deployed to Heroku. Typo wasn't built with Heroku in
    mind, but the changes needed to deploy to Heroku have already been made in
    our fork of the Typo repository.  From within your copy of the Typo
    repository, run:

        heroku create
        git push heroku master
        heroku run rake db:migrate
        heroku run rake db:seed

### Specify features

We want to add a useful feature called article merging. When there are multiple
bloggers on one site, the authors may write more than one article on the same
topic and say similar things. The user will be able to visit the article view,
and, if they are an admin, there should be a form on that article's edit page
that allows an administrator to enter in the ID of another article to merge the
current article with. When this happens, we want to preserve both articles'
content, but merge them together into one article. You should verify that both
specified articles exist, and that they are not the same article.

**Specifications:**

*   A non-admin cannot merge articles.
*   When articles are merged, the merged article should contain the text of both
    previous articles.
*   When articles are merged, the merged article should have one author (either
    one of the authors of the two original articles).
*   Comments on each of the two original articles need to all carry over and
    point to the new, merged article.
*   The title of the new article should be the title from either one of the
    merged articles.
*   The form field containing the ID of the article to merge with must have the
    HTML attribute name set to merge_with. This requirement is present for the
    sole purpose of allowing the autograder to identify the merge functionality
    in your deployed application and is not something you would normally do in
    Rails. There should be exactly one input element with the name merge_with on
    the edit article page.

Start by **writing cucumber scenarios** for the above behaviors. You will
probably want to put them in separate feature files but you may add them to the
existing feature files. Over the rest of part 1 and all of part 2 we will make
these go green.

Below is a mockup for the merge articles interface
[hi-res](http://imgur.com/Ujmdh). The form for merging articles should be on the
edit page for an article and it should let the user input the id of the article
to be merged with. The merge interface should not be presented for new articles
nor to non-administrators, but it is fine for the merge articles functionality
to be present for drafts (we will not conduct any tests using draft articles).

![Merge-Form](https://lh4.googleusercontent.com/PndYaWhSYWTLL44Z3RhF-2PRskE1eSHhQt0Ar0ZGQ1C0cgaJh_cDXcsXI_0yaS_7qzMc3cJDNQ8IrT_UBzaKlR_03HRXmwhAZw24wb1VbJ25)

### Start driving changes through specs

Starting with scenarios 1 and 2 above, you will create the Cucumber tests to
drive the code changes for each scenario. The second one will be toughest,
because you will have to create the basic functionality that allows merging to
happen. Subsequent specs will be easier as they will require only incremental
code.

For Scenarios 1 and 2:

*   Start by implementing the step definitions that will show an admin (but not
    a regular user) a "Merge With This Article" button which, when clicked, will
    dispatch to a controller action that does the merge.
*   Let those step definitions drive the creation of controller specs, as we did
    in the example in ELLS chapter 5. Obviously the merging functionality itself
    should go in the model, not the controller, so feel free to assume an
    instance method of the ```Article``` model
    ```merge_with(other_article_id)```. Eventually, this method will return an
    article object that is the merged article, and also handles all of the
    considerations above. Get these specs to pass green. Commit.


Part 2
------

### Fixing a bug in Typo

The version of typo you have checked out contains a bug that prevents categories
from being created or edited. To see this bug, make sure you are logged in as an
administrator and click on the "categories" link on the left hand side of the
admin page. The page is intended to look as follows:

![Category-Page](https://lh3.googleusercontent.com/wsHFZG4Jf2yYwsyOIJfEk5JT0aaKnRU_WG_YvMunRL_8uEXdh8QSxINNVbl27WVUBmZxg3yR1Kx_sO5FULzLTMAVJApuDypM_ds84PU20tx7)

This page is intended to allow you to add and edit blogging categories. Fix this
bug by writing cucumber tests that fail when this bug is present and pass when
you can successfully edit existing categories and create new categories.

