require "rails_helper"

RSpec.feature "Showing an article" do

  before do
    @john = User.create!(email: "me@example.com", password: "password")
    @fred = User.create!(email: "fred@example.com", password: "password")
    # create article
    @article = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.", user: @john)
  end

  scenario "to non-signed in user, hide the Edit and Delete buttons " do

    # visit root
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    #test path
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end

  scenario "to non-OWNER, hide the Edit and Delete buttons " do
    login_as(@fred)
    # visit root
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    #test path
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
end
