class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id]) #URLのidから番号を持ってきてくれる
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id #ユーザーidのところに今ログインしている人の情報が入って、user_idが保持される
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
end
