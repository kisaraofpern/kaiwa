require 'rails_helper'

feature "Sign up" do
  # As a prospective user
  # I want to create an account
  # So that I can post venues and review them

  scenario "Specifying valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'skohto'
    fill_in 'Password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    fill_in 'Email', with: 'sakura@dts.com'

    click_button 'Sign Up'

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(page).to have_content "Signed in as skohto"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "User omits required information" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end

  scenario "User gives invalid information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'mkaiba'
    fill_in 'Password', with: '123'
    fill_in 'Password Confirmation', with: '321'
    fill_in 'Email', with: 'skohto@dts'
    click_button 'Sign Up'

    expect(page).to have_content "Password is too short (minimum is 6 chara"
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_content "Email is not formatted properly"
  end

  scenario "User gives email address that already has an account" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'skaiba'
    fill_in 'Password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    fill_in 'Email', with: user.email
    click_button 'Sign Up'

    expect(page).to have_content "An account already exists for that email add"
  end

  scenario "User gives username that already has an account" do
    FactoryGirl.create(:user,
      username: "skohto")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'skohto'
    fill_in 'Password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    fill_in 'Email', with: 'skaiba@kaibacorp.com'
    click_button 'Sign Up'

    expect(page).to have_content "An account already exists for that username!"
  end
end

feature "sign in" do
  # As an unauthenticated user
  # I want to sign in
  # So that I can post venues and review them

  scenario "user signs in successfully" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: "password123"
    click_button 'Sign In'

    expect(page).to have_content "Welcome back!"
    expect(page).to have_content "Signed in as #{user.username}"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "user enters incorrect password" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign In'

    expect(page).to have_content "Sorry! Invalid Username or Password."
  end
end

feature "sign out" do
  # As an authenticated user
  # I want to sign out
  # So that no one else can post venues or reviews on my behalf

  scenario "successful sign out" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Sign Out'

    expect(page).to have_content "Signed out successfully."
    expect(page).not_to have_content user.username
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
  end
end
