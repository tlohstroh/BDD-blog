require "rails_helper"

RSpec.feature "Users signin" do
  # create an account first
  before do
    @john = User.create!(email: "me@example.com", password: "password")
  end

  scenario "with valid credentials" do

    #visit /
    visit "/"
    #click link sign in
    click_link "Sign in"
    #fill in email
    fill_in "Email", with: "me@example.com"
    #fill in password
    fill_in "Password", with: "password"
    #click button sign in
    click_button "Log in"

    #expect page ti have successfully signed in
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
    #ec
  end
end
