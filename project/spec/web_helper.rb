def sign_up
  visit('/')
  click_button('Sign up')
  fill_in :first_name, with: 'Bart'
  fill_in :last_name, with: 'Kluczynski'
  fill_in :email_address, with: "bkluczynski@gmail.com"
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: '12345'
  click_button('Submit')
end
