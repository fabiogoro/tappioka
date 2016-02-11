require 'rails_helper'

feature 'Admin creates cuisine' do
  scenario 'successfully' do
    create(:user, is_admin: true)
    cuisine = build(:cuisine)

    login
    visit new_cuisine_path

    fill_in 'Nome', with: cuisine.name
    click_on 'Salvar'

    expect(page).to have_content cuisine.name
  end

  scenario 'and is not admin' do
    create(:user, is_admin: false)
    build(:cuisine)

    login
    visit new_type_path

    expect(page).to have_content "Você não pode criar categorias pois não é administrador."
  end
end
