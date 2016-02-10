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

  scenario 'and favourite it' do
    recipe = create(:recipe)

    login
    visit recipe_path(recipe)
    click_on 'Adicionar a Favoritas'

    expect(page).to have_content("Adicionou a Receita a suas Favoritas com sucesso!")
    expect(page).to have_content("1 favoritaram")
  end

  scenario 'and remove from favourites' do
    recipe = create(:recipe)

    login
    visit recipe_path(recipe)
    click_on 'Adicionar a Favoritas'
    click_on 'Remover de Favoritas'

    expect(page).to have_content("Removeu a Receita de suas Favoritas com sucesso.")
    expect(page).to have_content("0 favoritaram")
  end
end
