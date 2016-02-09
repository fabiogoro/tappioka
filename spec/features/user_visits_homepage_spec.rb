require 'rails_helper'

feature 'User visits homepage' do
  scenario 'and sees recipes' do
    recipe = create(:recipe)

    visit root_path

    expect(page).to have_text(I18n.t(:hello))
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.preference.name)
    expect(page).to have_content(recipe.type.name)
    expect(page).to have_content(recipe.difficulty)
    expect(page).to have_content(recipe.cuisine.name)
  end

  scenario 'and sees 20 last recipes' do
    create_list(:recipe, 30)

    visit root_path

    expect(page).to have_selector 'a.recipe-main', count: 20
  end

  scenario 'and lists jobs by cuisines' do
    cuisine = create(:cuisine, name: "Mexicana")
    recipe = create(:recipe, name: "Nacho", cuisine: cuisine)
    another_recipe = create(:recipe)

    visit root_path
    click_on cuisine.name

    expect(page).to have_content cuisine.name
    expect(page).to have_content recipe.name
    expect(page).not_to have_content another_recipe.name
  end

  scenario 'and lists jobs by types' do
    type = create(:type, name: "Salada")
    recipe = create(:recipe, name: "Salada de alface", type: type)
    another_recipe = create(:recipe)

    visit root_path
    click_on type.name

    expect(page).to have_content type.name
    expect(page).to have_content recipe.name
    expect(page).not_to have_content another_recipe.name
  end

  scenario 'and lists jobs by preferences' do
    preference = create(:preference, name: "Carnes")
    recipe = create(:recipe, name: "Bife acebolado", preference: preference)
    another_recipe = create(:recipe)

    visit root_path
    click_on preference.name

    expect(page).to have_content preference.name
    expect(page).to have_content recipe.name
    expect(page).not_to have_content another_recipe.name
  end
end
