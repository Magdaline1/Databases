require_relative './recipes'

class RecipeRepository
  def all
    result = DatabaseConnection.exec_params('SELECT id, names, cooking_time, rating FROM recipes;', [])

    recipes = []

    result.each do |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['names']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']

        recipes << recipe
      end
    return recipes
  end

  def find(id)
    sql = 'SELECT id, names, cooking_time, rating FROM recipes WHERE id = $1;'
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)
    record = result[0]

    found_recipes = []

    result.each do |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['names']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']
        
        found_recipes << recipe
    end
    return found_recipes[0]
  end
end