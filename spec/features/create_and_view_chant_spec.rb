require 'rails_helper'

feature 'Chants are creatable and viewable' do
  scenario 'User creates and views chant' do
    title = 'აღდგომასა შენსა'

    visit new_chant_path

    fill_in 'სათაური', with: title

    click_on 'საგალობელი შექმნი'

    expect(page).to have_css 'p', title
  end
end
