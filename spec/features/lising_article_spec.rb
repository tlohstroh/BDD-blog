require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    john = User.create!(email: "me@example.com", password: "password")
    # no need to log in here!
    # create 2 Articles
    @article1 = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.", user: john)
    @article2 = Article.create(title: "The second article", body: "Pellentesque ac ligula in tellus feugiat.", user: john)
  end

  scenario "A user lists all artiles" do

    # list the 2 Articles
    visit "/"

    # expect both article titles and bodies to be present
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)

  end

  scenario "A user has no articles" do

    Article.delete_all

    # list the 2 Articles
    visit "/"

    # expect both article titles and bodies to be present
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)

    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within ("h1#no-articles") do
      expect(page).to have_content("No Articles Created")
    end

  end

end
