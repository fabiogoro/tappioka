class RecipeMailer < ApplicationMailer
  default from: 'falecomtappioka@gmail.com'

  def recipe_email(recipe, user)
    @recipe = recipe
    @user = user
    mail(to: @user.email, subject: "Estou compartilhando uma receita: "+@recipe.name)
  end
end
