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
        expect(page).to have_text 'Login'
        expect(page).to have_text 'Register'
        expect(page).to have_button 'Go to Drinks'
        expect(page).to have_button 'Go to Snacks'
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end
  end

  describe 'Pages' do
    scenario 'visiting the drinks page' do
      visit drinks_page_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).to have_text 'Login'
        expect(page).to have_text 'Register'
        expect(page).to have_text 'DRINKS'
        expect(page).to have_text(
          'We have a variety of drinks you can taste, from a single cold beer to some cocktails to taste them.'
        )
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end

    it 'has some behaviour' do
      visit snacks_page_path

      aggregate_failures do
        expect(page).to have_text 'DrinksStore'
        expect(page).to have_link 'Home', href: root_path
        expect(page).to have_link 'Drinks', href: drinks_page_path
        expect(page).to have_link 'Snacks', href: snacks_page_path
        expect(page).to have_text 'Login'
        expect(page).to have_text 'Register'
        expect(page).to have_text 'SNACKS'
        expect(page).to have_text(
          'We have some delicious snacks to complement you favourite drink like: chicken wings, boneless, onion, rings, ...'
        )
        expect(page).to have_link 'przant'
        expect(page).to have_text 'Powered by'
      end
    end
  end
end
