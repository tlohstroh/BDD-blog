require "rails_helper"

RSpec.feature "Editing an article" do

  # create an article
  before do
    @article = Article.create(title: "First Article", body: "Lorem lorem lorem")
  end

  scenario "A user updates an article" do
    # visit /
    visit "/"
    # click link article
    click_link @article.title
    # click edit article
    click_link "Edit Article"
    # update Title
    fill_in "Title", with: "Updated Article"
    # update Body
    fill_in "Body", with: "Lorem Ipsum"
    # click update
    click_button "Update Article"

    # expext page to have succes message
    expect(page).to have_content("Article has been updated")
    # expext article to be on new article page
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    # visit /
    visit "/"
    # click link article
    click_link @article.title
    # click edit article
    click_link "Edit Article"
    # update Title
    fill_in "Title", with: ""
    # update Body
    fill_in "Body", with: "Lorem Ipsum"
    # click update
    click_button "Update Article"

    # expext page to have succes message
    expect(page).to have_content("Article has not been updated")
    # expext article to be on new article page
    expect(page.current_path).to eq(article_path(@article))
  end
end
