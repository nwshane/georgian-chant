require 'rails_helper'

feature 'Home page has heading' do
  scenario 'User navigates to home page and reads heading' do
    visit root_path

    expect(page).to have_css 'h1', text: 'Georgian Chant'
  end
end
