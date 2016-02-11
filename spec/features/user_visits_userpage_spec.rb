require 'rails_helper'

feature 'User visits userpage' do
  scenario 'and sees his recipes' do
    user = create(:user)
    recipe = create(:recipe, user: user)

    visit user_path(user)

    expect(page).to have_selector 'table.recipe-main-table.type'
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preference.name)
    expect(page).to have_content(recipe.type.name)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.cuisine.name)
  end

  scenario 'and sees his personal info' do
    user = create(:user)
    create(:recipe, user: user)

    visit user_path(user)

    expect(page).to have_selector 'table.recipe-main-table.type'
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.city)
  end

  scenario 'and see favourite recipes' do
    creator_user = create(:user, email: 'ze@gmail.com')
    recipe = create(:recipe, user: creator_user)

    logged_user = create(:user)
    login
    visit recipe_path(recipe)
    click_on 'Adicionar a Favoritas'

    visit user_path(logged_user)

    expect(page).to have_selector 'table.recipe-main-table.cuisine'
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preference.name)
    expect(page).to have_content(recipe.type.name)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.cuisine.name)
  end
end
