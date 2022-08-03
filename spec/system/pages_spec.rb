# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :system do
  describe 'Landing page' do
    scenario 'visiting the root/landing page' do
      visit root_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).not_to have_link 'Promos', href: promos_page_path
        expect(page).to have_link 'Login', href: new_user_session_path
        expect(page).to have_link 'Register', href: new_user_registration_path
        expect(page).to have_link 'Go to Drinks', href: drinks_page_path
        expect(page).to have_link 'Go to Snacks', href: snacks_page_path
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end
  end

  describe 'Pages' do
    let(:example_user) { create :user, role: 'User' }
    let!(:example_promos) { create_list :promo, 3, active: true }

    scenario 'visiting the drinks page' do
      visit drinks_page_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).not_to have_link 'Promos', href: promos_page_path
        expect(page).to have_link 'Login', href: new_user_session_path
        expect(page).to have_link 'Register', href: new_user_registration_path
        expect(page).to have_text 'DRINKS'
        expect(page).to have_text(
          'We have a variety of drinks you can taste, from a single cold beer to some cocktails to taste them.'
        )
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end

    scenario 'visiting the snacks page' do
      visit snacks_page_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).not_to have_link 'Promos', href: promos_page_path
        expect(page).to have_link 'Login', href: new_user_session_path
        expect(page).to have_link 'Register', href: new_user_registration_path
        expect(page).to have_text 'SNACKS'
        expect(page).to have_text(
          'We have some delicious snacks to complement you favourite drink like: chicken wings, boneless, onion, rings, ...'
        )
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end

    scenario 'a registered user visits the promotions page' do
      visit root_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).not_to have_link 'Promos', href: promos_page_path
        expect(page).to have_link 'Login', href: new_user_session_path
        expect(page).to have_link 'Register', href: new_user_registration_path
        expect(page).to have_link 'Go to Drinks', href: drinks_page_path
        expect(page).to have_link 'Go to Snacks', href: snacks_page_path
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'

        click_on 'Login'

        expect(page).to have_link 'Back', href: root_path
        expect(page).to have_text 'Log in'
        expect(page).to have_text 'Email'
        expect(page).to have_text 'Password'

        fill_in 'Email', with: example_user.email
        fill_in 'Password', with: example_user.password

        click_on 'Log in'

        expect(page).to have_text 'Signed in successfully.'
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).to have_link 'Promos', href: promos_page_path
        expect(page).to have_link example_user.email, href: edit_user_registration_path
        expect(page).to have_button 'Logout'

        click_on 'Promos'

        expect(page).to have_text 'SamplePromo', count: 3
        expect(page).to have_text 'Sample description for the Promo', count: 3
        expect(page).to have_text '$50', count: 3
      end
    end
  end
end
