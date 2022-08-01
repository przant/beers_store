# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let(:existing_user) { create :user }

  describe 'An existing user wants to login' do
    it 'The user fails to login (i.e. wrong email and password)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'
      expect(page).to have_link 'Sign up', href: new_user_registration_path
      expect(page).to have_link 'Forgot your password?', href: new_user_password_path

      fill_in 'Email', with: 'wrong_email@example.com'
      fill_in 'Password', with: 'wrongpassword'

      click_button 'Log in'

      expect(page).to have_text 'Invalid Email or password.'
    end

    it 'The user fails to login (i.e. wrong email)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'
      expect(page).to have_link 'Sign up', href: new_user_registration_path
      expect(page).to have_link 'Forgot your password?', href: new_user_password_path

      fill_in 'Email', with: 'wrong_email@example.com'
      fill_in 'Password', with: '12345678'

      click_button 'Log in'

      expect(page).to have_text 'Invalid Email or password.'
    end

    it 'The user fails to login (i.e. wrong password)' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'
      expect(page).to have_link 'Sign up', href: new_user_registration_path
      expect(page).to have_link 'Forgot your password?', href: new_user_password_path

      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: 'badpass'

      click_button 'Log in'

      expect(page).to have_text 'Invalid Email or password.'
    end

    it 'The user login successfully' do
      visit root_path

      expect(page).to have_link 'Login', href: new_user_session_path
      expect(page).to have_link 'Register', href: new_user_registration_path

      click_link 'Login'

      expect(page).to have_link 'Back', href: root_path
      expect(page).to have_text 'Log in'
      expect(page).to have_link 'Sign up', href: new_user_registration_path
      expect(page).to have_link 'Forgot your password?', href: new_user_password_path

      fill_in 'Email', with: existing_user.email
      fill_in 'Password', with: '12345678'

      click_button 'Log in'

      expect(page).to have_link existing_user.email, href: edit_user_registration_path
      expect(page).to have_button 'Logout'
      expect(page).to have_text 'Signed in successfully.'
    end
  end
end
