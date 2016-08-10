def sign_up(email_address: "bkluczynski@gmail.com", password: '12345', password_confirmation: '12345')
  visit('/')
  click_button('Sign up')
  fill_in :first_name, with: 'Bart'
  fill_in :last_name, with: 'Kluczynski'
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('Submit')
end

def create_space(name: ,description: ,price: , available_from: , available_to:)
  visit '/spaces/new'
   fill_in(:SpaceName, with: name)
   fill_in(:Description, with: description)
   fill_in(:Price, with: price)
   fill_in(:Available_from, with: available_from)
   fill_in(:Available_to, with: available_to)
   click_button('Create')
end

def sign_in(email_address:, password:)
  visit("/sessions/new")
  fill_in :email_address, with: email_address
  fill_in :password, with: password
  within 'form#sign_in' do
    click_button "Sign in"
  end
end

def sign_out
  click_button("Sign out")
end

def book_space(space)
  visit('/spaces')
  within 'ul#spaces' do
    click_button(space)
  end
  fill_in('calender', with: '16/01/28')
  click_button('Request to book')
end
