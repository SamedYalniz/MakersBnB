def sign_up
  visit('/')
  click_link('Sign up')
  fill_in :first_name, with: 'Bart'
  fill_in :last_name, with: 'Kluczynski'
  fill_in :email_address, with: "bkluczynski@gmail.com"
  fill_in :password, with: '12345'
  fill_in :password_confirmation, with: '12345'
  click_button('Submit')
end

def create_space(name, description, price, available_from, available_to)
  visit '/spaces/new'
   fill_in('SpaceName', with: name)
   fill_in('Description', with: description)
   fill_in('Price', with: price)
   fill_in('Available_from', with: available_from)
   fill_in('Available_to', with: available_to)

   click_button('Create')
end
