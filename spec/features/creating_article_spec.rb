require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    # visit root page
    visit "/"
    # click on new Article
    click_link "New Article"
    # fill in title
    fill_in "Title", with: "Creating a blog"
    # fill in body
    fill_in "Body", with: "Lorem Ipsum"
    # create Article
    click_button "Create Article"

    #### expextations ###
    # Article has been created
    expect(page).to have_content("Article has been created")
    # articles path
    expect(page.current_path).to eq(articles_path)
  end
end
