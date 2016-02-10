require 'rails_helper'

feature 'Admin creates type' do
  scenario 'successfully' do
    user = create(:user, is_admin: true)
    type = build(:type)

    login
    visit new_type_path

    fill_in 'Nome', with: type.name
    click_on 'Salvar'

    expect(page).to have_content type.name
  end

  scenario 'and is not admin' do
    user = create(:user, is_admin: false)
    type = build(:type)

    login
    visit new_type_path

    expect(page).to have_content "Você não pode criar categorias pois não é administrador."
  end
end
