require 'rails_helper'

feature 'User visits homepage' do
  scenario 'successfully' do
    recipe = build(:recipe)

    visit new_recipe_path

    fill_in "Nome", with: recipe.name
    fill_in "Porções", with: recipe.servings
    fill_in "Pronto em", with: recipe.ready_in
    fill_in "Ingredientes", with: recipe.ingredients
    fill_in "Modo de preparo", with: recipe.directions
    select recipe.cuisine.name, from: "Cozinha"
    select recipe.type.name, from: "Tipo"
    select recipe.preference.name, from: "Preferência"
    choose recipe.difficulty

    click_on "Salvar"

    expect(current_path).to eq '/recipes/1'
  end
end
