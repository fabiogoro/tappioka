require 'rails_helper'

feature 'User creates new recipe' do
  scenario 'successfully' do
    recipe = build(:recipe)

    login
    visit new_recipe_path

    fill_in 'Nome', with: recipe.name
    attach_file 'Foto', File.absolute_path('/home/user/Downloads/index.jpeg')
    fill_in 'Rendimento', with: recipe.servings
    fill_in 'Pronto em', with: recipe.ready_in
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Modo de preparo', with: recipe.directions
    select recipe.cuisine.name, from: 'Cozinha'
    select recipe.type.name, from: 'Tipo'
    select recipe.preference.name, from: 'Preferência'
    choose recipe.difficulty

    click_on 'Salvar'

    expect(current_path).to eq '/recipes/1'
    expect(page).to have_css('img')
  end

  scenario 'without logging in' do
    recipe = build(:recipe)

    visit new_recipe_path

    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Para continuar, efetue login ou registre-se.'
  end
end
