
feature 'user books a new space ' do
  scenario 'send a request, and a second one' do
          sign_up
          create_space(name: 'Second Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
          create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
          sign_out
          sign_up(email_address: "s.yalniz@gmail.com", password: '12345', password_confirmation: '12345')
          book_space('Barts Place')
          expect(page).to have_content('The request to book has been delivered')
          expect(current_path).to eq('/requests')
          require 'pry';binding.pry
          within 'ul#sent_requests' do
            expect(page).to have_content('Barts Place')
          end
          visit '/spaces'
          book_space('Second Place')
          within 'ul#sent_requests' do
            expect(page).to have_content('Barts Place')
            expect(page).to have_content('Second Place')
          end
      end






end
