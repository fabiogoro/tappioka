require 'rails_helper'

feature 'User views recipe' do
  scenario 'successfully' do
    recipe = create(:recipe)

    visit recipe_path(recipe)

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preference.name)
    expect(page).to have_content(recipe.type.name)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.cuisine.name)
    expect(page).to have_content(recipe.ready_in)
    expect(page).to have_content(recipe.servings)
    expect(page).to have_content(recipe.directions)
    expect(page).to have_content(recipe.ingredients)
  end
end
