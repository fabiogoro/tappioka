require 'rails_helper'

feature 'Admin creates preference' do
  scenario 'successfully' do
    create(:user, is_admin: true)
    preference = build(:preference)

    login
    visit new_preference_path

    fill_in 'Nome', with: preference.name
    click_on 'Salvar'

    expect(page).to have_content preference.name
  end

  scenario 'and is not admin' do
    create(:user, is_admin: false)
    build(:preference)

    login
    visit new_type_path

    expect(page).to have_content 'Você não pode criar categorias pois não é administrador.'
  end
end
