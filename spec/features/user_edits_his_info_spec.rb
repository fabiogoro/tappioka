require 'rails_helper'

feature 'User edits his info' do
  scenario 'successfully' do
    user = create(:user)

    login
    visit edit_user_registration_path(user)

    fill_in 'Nome', with: 'Pedro'
    fill_in 'Senha atual', with: '12345678'

    click_on 'Atualizar'

    expect(page).to have_content('Sua conta foi atualizada com sucesso.')
    visit user_path(user)
    expect(page).to have_content('Pedro')
  end
end
