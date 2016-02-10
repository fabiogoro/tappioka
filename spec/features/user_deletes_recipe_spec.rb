require 'rails_helper'

feature 'User edits recipe' do
  scenario 'successfully' do
    recipe = create(:recipe)

    login
    visit recipe_path(recipe)

    click_on 'Deletar'

    expect(page).to have_content('Removeu a Receita com sucesso.')
  end
end
