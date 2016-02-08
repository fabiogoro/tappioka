require 'rails_helper'

feature 'User visits homepage' do
  scenario 'successfully' do
    recipe = create(:recipe)

    visit root_path

    expect(page).to have_text(I18n.t(:hello))
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preference.name)
    expect(page).to have_content(recipe.type.name)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.cuisine.name)
  end
end
