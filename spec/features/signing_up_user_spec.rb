require "rails_helper"

RSpec.feature "Signup user" do
  # create user

  before do

  end

  ## valid signup
  scenario "a user signs with valid credential" do

    # visit "/"
    visit "/"
    # click signup link
    click_link "Sign up"
    # email
    fill_in "Email", with: "user@example.com"
    # password
    fill_in "Password", with: "password"
    # password confirmation
    fill_in "Password confirmation", with: "password"
    # link to actually sign up
    click_button "Sign up"

    # expect content to have succes message
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end


  ## invalid signup
  scenario "a user signs without valid credential" do

    # visit "/"
    visit "/"
    # click signup link
    click_link "Sign up"
    # email
    fill_in "Email", with: ""
    # password
    fill_in "Password", with: ""
    # password confirmation
    fill_in "Password confirmation", with: ""
    # link

    # expect(page).to have_content("You have not signed up succesfully")
  end


end
