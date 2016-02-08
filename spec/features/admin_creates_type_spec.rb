require 'rails_helper'

feature 'Admin creates type' do
  scenario 'successfully' do
    type = build(:type)

    visit new_type_path

    fill_in 'Nome', with: type.name
    click_on 'Salvar'

    expect(page).to have_content type.name
  end
end
