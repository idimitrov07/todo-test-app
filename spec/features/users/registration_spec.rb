require 'spec_helper'

describe "Signing up" do

  it "allows user to sign up and creates object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign up")
    click_link "Sign up"

    fill_in "First Name", with: "Jason"
    fill_in "Last Name", with: "Seifer"
    fill_in "Email", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "password1234"
    fill_in "Password (again)", with: "password1234"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end

  it "displays a tutorial when a user signs up" do
    visit "/"
    click_link "Sign up"

    fill_in "First Name", with: "Jason"
    fill_in "Last Name", with: "Seifer"
    fill_in "Email", with: "jason@teamtreehouse.com"
    fill_in "Password", with: "password1234"
    fill_in "Password (again)", with: "password1234"
    click_button "Sign Up"

    expect(page).to have_content("ODOT Tutorial")
    click_on "ODOT Tutorial"
    expect(page.all("li.todo-item").size).to eq(7)

  end

end
