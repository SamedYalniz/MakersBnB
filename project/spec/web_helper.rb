def sign_up(email_address: "bkluczynski@gmail.com", password: '12345', password_confirmation: '12345')
  visit('/')
  click_link('Sign up')
  fill_in :first_name, with: 'Bart'
  fill_in :last_name, with: 'Kluczynski'
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Submit')
end

def create_space(name)
  visit '/spaces/new'
   fill_in('SpaceName', with: name)
   click_button('Create')
end

def sign_in(email_address:, password:)
  visit("/sessions/new")
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  click_button "Sign in"
end
