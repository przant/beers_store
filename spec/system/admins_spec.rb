# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admins', type: :system do
  describe 'Admins pages' do
    let(:example_user) { create :user, :admin_user }

    describe 'creating a new drink, snack and promo' do
      scenario 'An admin user visits the Admin Panel' do
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
          expect(page).to have_link 'Admin Panel', href: dashboard_admins_path
          expect(page).to have_link 'Home', href: root_path
          expect(page).to have_link 'Drinks', href: drinks_page_path
          expect(page).to have_link 'Snacks', href: snacks_page_path
          expect(page).to have_link 'Promos', href: promos_page_path
          expect(page).to have_link example_user.email, href: edit_user_registration_path
          expect(page).to have_button 'Logout'

          click_on 'Admin Panel'

          expect(page).to have_text "Welcome #{example_user.fullname}"
          expect(page).to have_text 'Users info'
          expect(page).to have_text "You don't have have any user registered"
          expect(page).to have_text 'Drinks info'
          expect(page).to have_text "You currently don't have any drink to offer"
          expect(page).to have_text 'Snacks info'
          expect(page).to have_text "You currently don't have any snack to offer"
          expect(page).to have_text 'Promos info'
          expect(page).to have_text "You currently don't have any promo to offer"
          expect(page).to have_link 'Dashboard', href: dashboard_admins_path
          expect(page).to have_link 'New Drink', href: new_drink_admins_path
          expect(page).to have_link 'New Snack', href: new_snack_admins_path
          expect(page).to have_link 'New Promo', href: new_promo_admins_path
        end
      end

      scenario 'An admin user can create a New Drink' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password
          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Drinks info'
          expect(page).to have_text "You currently don't have any drink to offer"

          click_on 'New Drink'

          expect(page).to have_text "Welcome #{example_user.fullname}"
          expect(page).to have_text 'Create New Drink'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text 'Price'
          expect(page).to have_button 'Add new drink'

          fill_in 'Name', with: 'Super new drink'
          fill_in 'Description', with: 'A hit hard super fresh drink with Mezcal base and citrus juice'
          fill_in 'Ingredients', with: 'Mezcal 2oz, Citrus Juice 1/2 lt, Lima soda 1/4 lt'
          # Let default price selected from range slide form-range: $125.00

          click_on 'Add new drink'

          expect(page).to have_text 'Drink was successfully created.'
          expect(page).to have_text 'Super new drink'
          expect(page).to have_text '$125.0'
          expect(page).to have_text 'A hit hard super fresh drink with Mezcal base and citrus juice'
          expect(page).to have_text 'Ingredients'

          click_on 'Ingredients'

          expect(page).to have_text 'Mezcal 2oz, Citrus Juice 1/2 lt, Lima soda 1/4 lt'

          click_on 'Back to list'

          expect(page).to have_text 'Drinks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Super new drink'
          expect(page).to have_text 'Price'
          expect(page).to have_text '125.0'
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'
        end
      end

      scenario 'An admin user can create a New Snack' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password
          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text "You currently don't have any snack to offer"

          click_on 'New Snack'

          expect(page).to have_text "Welcome #{example_user.fullname}"
          expect(page).to have_text 'Create New Snack'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text 'Price'
          expect(page).to have_button 'Add new snack'

          fill_in 'Name', with: 'Super new snack'
          fill_in 'Description', with: 'Super delicious mango-habanero chicken wings'
          fill_in 'Ingredients', with: '8 chicken wings, mango-habanero sauce'
          # Let default price selected from range slide form-range: $125.00

          click_on 'Add new snack'

          expect(page).to have_text 'Snack was successfully created.'
          expect(page).to have_text 'Super new snack'
          expect(page).to have_text '$125.0'
          expect(page).to have_text 'Super delicious mango-habanero chicken wings'
          expect(page).to have_text 'Ingredients'

          click_on 'Ingredients'

          expect(page).to have_text '8 chicken wings, mango-habanero sauce'

          click_on 'Back to list'

          expect(page).to have_text 'Snacks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Super new snack'
          expect(page).to have_text 'Price'
          expect(page).to have_text '125.0'
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'
        end
      end

      scenario 'An admin user can create a New Promo' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password
          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Promos info'
          expect(page).to have_text "You currently don't have any promo to offer"

          click_on 'New Promo'

          expect(page).to have_text "Welcome #{example_user.fullname}"
          expect(page).to have_text 'Create New Promo'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text 'Price'
          expect(page).to have_unchecked_field 'Active'
          expect(page).to have_button 'Add new promo'

          fill_in 'Name', with: 'Super new promo'
          fill_in 'Description', with: 'Everything you can drink for only $300 (personal promo)'
          check 'Active'
          # Let default price selected from range slide form-range: $125.00

          click_on 'Add new promo'

          expect(page).to have_text 'Promo was successfully created.'
          expect(page).to have_text 'Super new promo'
          expect(page).to have_text '$125.0'
          expect(page).to have_text 'Everything you can drink for only $300 (personal promo)'

          click_on 'Back to list'

          expect(page).to have_text 'Promos List'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Super new promo'
          expect(page).to have_text 'Price'
          expect(page).to have_text '125.0'
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'
        end
      end
    end

    describe 'editing existing drinks, snacks, and promos' do
      let!(:example_drink) { create :drink }
      let!(:example_snack) { create :snack }
      let!(:example_promo) { create :promo, :active_promo }

      scenario 'An admin user fails to edit an existing drink' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Drinks info'
          expect(page).to have_text 'You have 1 drink to offer!'
          expect(page).to have_link 'Drinks List', href: drinks_admins_path

          click_on 'Drinks List'

          expect(page).to have_text 'Drinks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_drink.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_drink.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Drink'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_drink.description
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text example_drink.ingredients
          expect(page).to have_text 'Price'

          fill_in 'Name', with: ''
          fill_in 'Description', with: ''
          fill_in 'Ingredients', with: ''

          click_on 'Update drink'

          expect(page).to have_text 'Update Drink'
          expect(page).to have_text '5 errors'
          expect(page).to have_text "Name can't be blank"
          expect(page).to have_text "Description can't be blank"
          expect(page).to have_text 'Description is too short (minimum is 30 characters)'
          expect(page).to have_text "Ingredients can't be blank"
          expect(page).to have_text 'Ingredients is too short (minimum is 3 characters)'
        end
      end

      scenario 'An admin user edits an existing drink' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Drinks info'
          expect(page).to have_text 'You have 1 drink to offer!'
          expect(page).to have_link 'Drinks List', href: drinks_admins_path

          click_on 'Drinks List'

          expect(page).to have_text 'Drinks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_drink.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_drink.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Drink'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_drink.description
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text example_drink.ingredients
          expect(page).to have_text 'Price'

          fill_in 'Name', with: 'New drink name'
          fill_in 'Description', with: 'New description for the exisitng drink in the system'
          fill_in 'Ingredients', with: 'New list of ingredients for the existing drink in the system'

          click_on 'Update drink'

          expect(page).to have_text 'Drink was successfully updated.'
          expect(page).to have_text 'New drink name'
          expect(page).to have_text "$#{example_drink.price}"
          expect(page).to have_text 'New description for the exisitng drink in the system'
          expect(page).to have_text 'Ingredients'

          click_on 'Ingredients'

          expect(page).to have_text 'New list of ingredients for the existing drink in the system'
        end
      end

      scenario 'An admin user fails to edit an existing snack' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text 'You have 1 snack to offer!'
          expect(page).to have_link 'Snacks List', href: snacks_admins_path

          click_on 'Snacks List'

          expect(page).to have_text 'Snacks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_snack.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_snack.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Snack'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_snack.description
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text example_snack.ingredients
          expect(page).to have_text 'Price'

          fill_in 'Name', with: ''
          fill_in 'Description', with: ''
          fill_in 'Ingredients', with: ''

          click_on 'Update snack'

          expect(page).to have_text 'Update Snack'
          expect(page).to have_text '5 errors'
          expect(page).to have_text "Name can't be blank"
          expect(page).to have_text "Description can't be blank"
          expect(page).to have_text 'Description is too short (minimum is 30 characters)'
          expect(page).to have_text "Ingredients can't be blank"
          expect(page).to have_text 'Ingredients is too short (minimum is 3 characters)'
        end
      end

      scenario 'An admin user edits an existing snack' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text 'You have 1 snack to offer!'
          expect(page).to have_link 'Snacks List', href: snacks_admins_path

          click_on 'Snacks List'

          expect(page).to have_text 'Snacks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_snack.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_snack.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Snack'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_snack.description
          expect(page).to have_text 'Ingredients'
          expect(page).to have_text example_snack.ingredients
          expect(page).to have_text 'Price'

          fill_in 'Name', with: 'New snack name'
          fill_in 'Description', with: 'New description for the exisitng snack in the system'
          fill_in 'Ingredients', with: 'New list of ingredients for the existing snack in the system'

          click_on 'Update snack'

          expect(page).to have_text 'Snack was successfully updated.'
          expect(page).to have_text 'New snack name'
          expect(page).to have_text "$#{example_snack.price}"
          expect(page).to have_text 'New description for the exisitng snack in the system'
          expect(page).to have_text 'Ingredients'

          click_on 'Ingredients'

          expect(page).to have_text 'New list of ingredients for the existing snack in the system'
        end
      end

      scenario 'An admin user fails to edit an existing promo' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text 'You have 1 promo to offer!'
          expect(page).to have_link 'Promos List', href: promos_admins_path

          click_on 'Promos List'

          expect(page).to have_text 'Promos List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_promo.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_promo.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Promo'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_promo.description
          expect(page).to have_text 'Price'

          fill_in 'Name', with: ''
          fill_in 'Description', with: ''

          click_on 'Update promo'

          expect(page).to have_text 'Update Promo'
          expect(page).to have_text '3 errors'
          expect(page).to have_text "Name can't be blank"
          expect(page).to have_text "Description can't be blank"
          expect(page).to have_text 'Description is too short (minimum is 30 characters)'
        end
      end

      scenario 'An admin user edits an existing promo' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text 'You have 1 promo to offer!'
          expect(page).to have_link 'Promos List', href: promos_admins_path

          click_on 'Promos List'

          expect(page).to have_text 'Promos List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_promo.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_promo.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Edit'

          expect(page).to have_text 'Update Promo'
          expect(page).to have_text 'Name'
          expect(page).to have_text 'Description'
          expect(page).to have_text example_promo.description
          expect(page).to have_text 'Price'

          fill_in 'Name', with: 'New promo name'
          fill_in 'Description', with: 'New description for the exisitng promo in the system'

          click_on 'Update promo'

          expect(page).to have_text 'Promo was successfully updated.'
          expect(page).to have_text 'New promo name'
          expect(page).to have_text "$#{example_promo.price}"
          expect(page).to have_text 'New description for the exisitng promo in the system'
        end
      end
    end

    describe 'deleting existing drinks, snacks, and promos' do
      let!(:example_drink) { create :drink }
      let!(:example_snack) { create :snack }
      let!(:example_promo) { create :promo, :active_promo }
      scenario 'An admin user deletes an existing drink' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Drinks info'
          expect(page).to have_text 'You have 1 drink to offer!'
          expect(page).to have_link 'Drinks List', href: drinks_admins_path

          click_on 'Drinks List'

          expect(page).to have_text 'Drinks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_drink.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_drink.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Delete'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_text 'The drink was successfully removed.'
          expect(page).to have_text 'Drinks List'
          expect(page).to have_text 'There are no drinks to show'
        end
      end

      scenario 'An admin user deletes an existing snack' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Snacks info'
          expect(page).to have_text 'You have 1 snack to offer!'
          expect(page).to have_link 'Snacks List', href: snacks_admins_path

          click_on 'Snacks List'

          expect(page).to have_text 'Snacks List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_snack.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_snack.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Delete'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_text 'The snack was successfully removed.'
          expect(page).to have_text 'Snacks List'
          expect(page).to have_text 'There are no snacks to show'
        end
      end

      scenario 'An admin user deletes an existing promo' do
        visit root_path

        aggregate_failures do
          click_on 'Login'
          fill_in 'Email', with: example_user.email
          fill_in 'Password', with: example_user.password

          click_on 'Log in'
          click_on 'Admin Panel'

          expect(page).to have_text 'Promos info'
          expect(page).to have_text 'You have 1 promo to offer!'
          expect(page).to have_link 'Promos List', href: promos_admins_path

          click_on 'Promos List'

          expect(page).to have_text 'Promos List'
          expect(page).to have_text 'Name'
          expect(page).to have_text example_promo.name
          expect(page).to have_text 'Price'
          expect(page).to have_text example_promo.price
          expect(page).to have_link 'Details'
          expect(page).to have_link 'Edit'
          expect(page).to have_link 'Delete'

          click_on 'Delete'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_text 'The promo was successfully removed.'
          expect(page).to have_text 'Promos List'
          expect(page).to have_text 'There are no promotions to show'
        end
      end
    end
  end
end
