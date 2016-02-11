class RecipeMailer < ApplicationMailer
  default from: 'falecomtappioka@gmail.com'

  def recipe_email(recipe, user, email)
    @recipe = recipe
    @user = user
    @email = email
    mail(to: @email,
         subject: 'Estou compartilhando uma receita: ' + @recipe.name)
  end
end
