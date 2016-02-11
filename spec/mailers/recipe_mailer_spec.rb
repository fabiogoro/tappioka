require 'rails_helper'

RSpec.describe RecipeMailer, type: :mailer do
  describe 'Mail recipe' do
    it 'Has recipe info' do
      user = create(:user)
      recipe = create(:recipe, user: user)
      mail = RecipeMailer.recipe_email(recipe, user, 'fabiogo@outlook.com')
      expect(mail.subject).to eql('Estou compartilhando uma receita: Doce de leite')
      expect(mail.to).to eq ['fabiogo@outlook.com']
      expect(mail.html_part.decoded).to have_content(recipe.name)
      expect(mail.html_part.decoded).to have_content(recipe.directions)
      expect(mail.html_part.decoded).to have_content(recipe.ingredients)
    end
  end
end
