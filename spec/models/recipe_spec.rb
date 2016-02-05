require 'rails_helper'

describe Recipe, type: :model do
  it 'has name, cuisine, type, preference, servings,
      ready_in, difficulty, ingredients, directions, photo' do
    recipe = create :recipe
    binding.pry

    expect(recipe.name).to eq 'Doce de leite'
    expect(recipe.cuisine.name).to eq 'Mineira'
    expect(recipe.type.name).to eq 'Sobremesa'
    expect(recipe.preference.name).to eq 'Vegetariana'
    expect(recipe.servings).to eq 10
    expect(recipe.ready_in).to eq 10.minutes
    expect(recipe.ingredients).to eq '1 lata de leite condensado'
    expect(recipe.directions).to eq 'Esquente a lata em banho maria por 15 minutos. Espere esfriar e abra a lata'
  end
end
