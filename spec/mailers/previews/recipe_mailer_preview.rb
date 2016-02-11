# Preview all emails at http://localhost:3000/rails/mailers/recipe_mailer
class RecipeMailerPreview < ActionMailer::Preview
  def recipe_mail_preview
    RecipeMailer.recipe_email(Recipe.first, User.first)
  end
end
