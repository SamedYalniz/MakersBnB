
feature 'user creates new space' do
  scenario 'add new space to advertise' do
    sign_up
    visit '/spaces/new'
         expect(page.status_code).to eq(200)
         create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
         expect(current_path).to eq('/spaces')
         within'ul#spaces' do
           expect(page).to have_content('Barts Place')
   end

   end


  scenario 'I can see existing spaces' do
    sign_up
    create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
    visit'/spaces'
    expect(page.status_code).to eq(200)
    within'ul#spaces' do
      expect(page).to have_content('Barts Place')
    end
  end

  scenario 'add new spaces' do
    sign_up
    create_space(name: 'Sameds Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
    visit '/spaces/new'

   expect(page.status_code).to eq(200)
   create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
   expect(current_path).to eq('/spaces')
   within'ul#spaces' do
     expect(page).to have_content('Barts Place')
     expect(page).to have_content('Sameds Place')
   end

   end

   scenario 'adding new space with a description box' do
     sign_up
     create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
     visit('/spaces')
     expect(page.status_code).to eq(200)
     within'ul#spaces' do
       expect(page).to have_content('This is my amazingly beautiful space i want to tell you about so you can hire it out')
      end
    end

    scenario 'adding a nightly rate to a new space' do
      sign_up
      create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
      visit('/spaces')
      expect(page.status_code).to eq(200)
      within'ul#spaces' do
        expect(page).to have_content('£40')
      end
    end

    scenario 'adding an available from and an available to fields' do
      sign_up
      create_space(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '40', available_from: '16/08/15', available_to: '16/09/15')
      visit('/spaces')
     expect(page.status_code).to eq(200)
      within 'ul#spaces' do
        expect(page).to have_content("Available from: 2016-08-15")
        expect(page).to have_content("Available to: 2016-09-15")
      end
    end

    scenario 'Unknown user cannot create a new space' do
      visit '/spaces/new'
      expect(page).to have_content('Please sign in to list a space')

    end

    
end
