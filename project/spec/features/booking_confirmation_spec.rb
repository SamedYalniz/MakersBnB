feature 'user can confirm booking made to their space' do
  scenario 'user can see request to their space' do
    sign_up
    create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
    sign_out
    sign_up(email_address: 'bartjudge@me.com')
    book_space('Barts Place')
    sign_out
    sign_in(email_address: "bkluczynski@gmail.com", password: '12345')
    visit('/requests')
    within 'ul#received_requests' do
        expect(page).to have_content('Barts Place')
    end
  end
  scenario 'user can confirm request made on one of their spaces' do
    receive_request
    require 'pry'; binding.pry

    within 'ul#received_requests' do
    click_button('Barts Place')
    end
    expect(current_path).to eq('/requests/request')

    expect(page).to have_content('Barts Place')
    expect(page).to have_content('Bart')
    expect(page).to have_content('16/01/28')
  end
end
