require 'rails_helper'

feature 'User edits recipe' do
  scenario 'successfully' do
    recipe = create(:recipe)

    login
    visit edit_recipe_path(recipe)

    fill_in 'Nome', with: 'Mousse'

    click_on 'Salvar'

    expect(current_path).to eq '/recipes/1'
    expect(page).to have_content('Mousse')
  end

  scenario 'of another user' do
    user = create(:user, email: 'ze@gmail.com')
    recipe = create(:recipe, user: user)

    user = create(:user)
    login
    visit edit_recipe_path(recipe)

    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t(:cant_edit)
  end
end
