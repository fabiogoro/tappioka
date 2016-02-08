require 'rails_helper'

feature 'Admin creates preference' do
  scenario 'successfully' do
    preference = build(:preference)

    visit new_preference_path

    fill_in 'Nome', with: preference.name
    click_on 'Salvar'

    expect(page).to have_content preference.name
  end
end
