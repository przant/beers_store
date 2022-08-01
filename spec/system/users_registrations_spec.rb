# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  let(:existing_user) { create :user }

  describe 'A new user wants to sign-up' do
    scenario 'A user fails to sign-up (i.e. registration form is blank)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      click_button 'Sign Up'

      expect(page).not_to have_button 'Logout'
      expect(page).to have_text '6 errors prohibited this user from being saved:'
      expect(page).to have_text "Email can't be blank"
      expect(page).to have_text "Password can't be blank"
      expect(page).to have_text "Name can't be blank"
      expect(page).to have_text 'Name is too short (minimum is 3 characters)'
      expect(page).to have_text "Surname can't be blank"
      expect(page).to have_text 'Surname is too short (minimum is 3 characters)'
    end

    scenario 'A user fails to sign-u p(i.e. password to short)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      fill_in 'Name', with: 'ExampleName'
      fill_in 'Surname', with: 'ExampleSurname'
      fill_in 'Email', with: 'example@test.com'
      fill_in 'Password', with: '12345'
      fill_in 'Password confirmation', with: '12345'

      click_button 'Sign Up'

      expect(page).not_to have_button 'Logout'
      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text 'Password is too short (minimum is 6 characters)'
    end

    scenario "A user fails to sign up (i.e. password doesn't match" do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      fill_in 'Name', with: 'ExampleName'
      fill_in 'Surname', with: 'ExampleSurname'
      fill_in 'Email', with: 'example@test.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '87654321'

      click_button 'Sign Up'

      expect(page).not_to have_button 'Logout'
      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text "Password confirmation doesn't match Password"
    end

    scenario 'A user fails to sign up (i.e. email is already taken)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      fill_in 'Name', with: 'ExampleName'
      fill_in 'Surname', with: 'ExampleSurname'
      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign Up'

      expect(page).not_to have_button 'Logout'
      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text 'Email has already been taken'
    end

    scenario 'A user fails to sign up (i.e. email is blank)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      fill_in 'Name', with: 'ExampleName'
      fill_in 'Surname', with: 'ExampleSurname'
      fill_in 'Email', with: ''
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign Up'

      expect(page).not_to have_button 'Logout'
      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text "Email can't be blank"
    end

    scenario 'A user signs up' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Register'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Create Account'

      fill_in 'Name', with: 'ExampleName'
      fill_in 'Surname', with: 'ExampleSurname'
      fill_in 'Email', with: 'example@email.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign Up'

      expect(page).to have_button 'Logout'
      expect(page).to have_text 'Welcome! You have signed up successfully.'
      expect(page).to have_text 'example@email.com'
    end
  end

  describe 'A existing user wants to update its account' do
    scenario 'A existing user fails to update its information (i.e current password goes empty)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'

      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: '12345678'

      click_button 'Log in'

      expect(page).to have_text 'Signed in successfully'
      expect(page).to have_link existing_user.email, href: edit_user_registration_path
      expect(page).to have_button 'Logout'

      click_link existing_user.email

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Edit Account'
      expect(page).to have_text 'Do you already have an account?'
      expect(page).to have_link 'Log in', href: new_user_session_path

      fill_in 'Name', with: 'Updated sample name'
      fill_in 'Surname', with: 'Updated sample surname'
      fill_in 'Email', with: 'updated@email.com'

      click_button 'Update account'

      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text "Current password can't be blank"
    end

    scenario 'A existing user fails to update its information (i.e wrong current password )' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'

      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: '12345678'

      click_button 'Log in'

      expect(page).to have_text 'Signed in successfully'
      expect(page).to have_link existing_user.email, href: edit_user_registration_path
      expect(page).to have_button 'Logout'

      click_link existing_user.email

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Edit Account'
      expect(page).to have_text 'Do you already have an account?'
      expect(page).to have_link 'Log in', href: new_user_session_path

      fill_in 'Name', with: 'Updated sample name'
      fill_in 'Surname', with: 'Updated sample surname'
      fill_in 'Email', with: 'updated@email.com'
      fill_in 'Current password', with: 'abcdefgh'

      click_button 'Update account'

      expect(page).to have_text '1 error prohibited this user from being saved:'
      expect(page).to have_text 'Current password is invalid'
    end
  end
end
