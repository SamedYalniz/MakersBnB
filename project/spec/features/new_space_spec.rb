
feature 'user creates new space' do
  scenario 'add new space to advertise' do
   #expecting a web-helper to automate log-ins
    visit '/spaces/new'

         expect(page.status_code).to eq(200)
         fill_in('SpaceName', with: 'Barts Place')
         click_button('Create')
         expect(current_path).to eq('/spaces')
         within'ul#spaces' do
           expect(page).to have_content('Barts Place')
   end

   end


  scenario 'I can see existing spaces' do
    Space.create(name: 'Barts Place')
    visit'/spaces'
    expect(page.status_code).to eq(200)
    within'ul#spaces' do
      expect(page).to have_content('Barts Place')
    end
  end

  scenario 'add new spaces' do
    create_space('Sameds Place')
    visit '/spaces/new'

   expect(page.status_code).to eq(200)
   fill_in('SpaceName', with: 'Barts Place')
   click_button('Create')
   expect(current_path).to eq('/spaces')
   within'ul#spaces' do
     expect(page).to have_content('Barts Place')
     expect(page).to have_content('Sameds Place')
   end

   end

   scenario 'adding new space with a description box' do
     Space.create(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out')
     visit('/spaces')
     expect(page.status_code).to eq(200)
     within'ul#spaces' do
       expect(page).to have_content('This is my amazingly beautiful space i want to tell you about so you can hire it out')
      end
    end

    scenario 'adding a nightly rate to a new space' do
      Space.create(name: 'Barts Place', description: 'This is my amazingly beautiful space i want to tell you about so you can hire it out', price: '£40' )
      visit('/spaces')
      expect(page.status_code).to eq(200)
      within'ul#spaces' do
        expect(page).to have_content('£40')
      end
    end








end
