require 'rails_helper'

feature 'User deletes his account' do
  scenario 'successfully' do
    user = create(:user)

    login
    visit edit_user_registration_path(user)

    click_on 'Cancelar conta'

    expect(page).to have_content("Tchau! Sua conta foi cancelada com sucesso. Esperamos vê-lo novamente em breve.")

    login
    expect(page).to have_content("E-mail ou senha inválidos.")
  end
end
