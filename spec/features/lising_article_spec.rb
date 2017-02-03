require "rails_helper"

RSpec.feature "Listing Articles" do
  before do
    # create 2 Articles
    @article1 = Article.create(title: "The first article", body: "Lorem ipsum dolor sit amet, consectetur.")
    @article2 = Article.create(title: "The second article", body: "Pellentesque ac ligula in tellus feugiat.")
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

end
