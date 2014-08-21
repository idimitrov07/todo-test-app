require 'spec_helper'

describe "Signing up" do

  it "allows user to sign up and creates object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    within("header") { click_link "Sign Up" }

    fill_in "First Name", with: "Jason"
    fill_in "Last Name", with: "Seifer"
    fill_in "Email", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "password1234"
    fill_in "Password (Again)", with: "password1234"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end

end
