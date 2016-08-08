require 'web_helper'

feature 'adding a new user' do
  scenario 'allows to increase the user count by one' do
    visit('/')
    click_button('Sign up')
    fill_in :first_name, with: 'Bart'
    fill_in :last_name, with: 'Kluczynski'
    fill_in :email_address, with: "bkluczynski@gmail.com"
    fill_in :password, with: '12345'
    fill_in :password_confirmation, with: '12345'
    click_button('Submit')
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Bart!')
    expect(User.first.email_address).to eq("bkluczynski@gmail.com")
  end
end
