require 'rails_helper'

feature 'Admin creates cuisine' do
  scenario 'successfully' do
    cuisine = build(:cuisine)

    visit new_cuisine_path

    fill_in 'Nome', with: cuisine.name
    click_on 'Salvar'

    expect(page).to have_content cuisine.name
  end
end
