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
  within 'div#sign_in' do
    click_button "Sign in"
  end
end

def sign_out
  within 'div#sign_out' do
    click_button("Sign out")
  end
end

def book_space(space)
  visit('/spaces')
  within 'div.spaces' do
    click_button(space)
  end
  fill_in('calender', with: '16/01/28')
  click_button('Request to book')
end

 def receive_request
   sign_up
   create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
   sign_out
   sign_up(email_address: 'bartjudge@me.com')
   book_space('Barts Place')
   sign_out
   sign_in(email_address: "bkluczynski@gmail.com", password: '12345')
   visit('/requests')
  end
