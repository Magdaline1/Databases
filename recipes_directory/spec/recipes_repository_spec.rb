require 'recipes_repository'

def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
end
  
describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end

    it 'returns all recipes and their info' do
        repo = RecipeRepository.new
        recipes = repo.all
        expect(recipes.length).to eq 2
        expect(recipes.first.id).to eq "1"
        expect(recipes.first.name).to eq "Carbonara"
        expect(recipes.first.cooking_time).to eq "25"
        expect(recipes.first.rating).to eq "3"
    end

    it 'finds an album' do
        repo = RecipeRepository.new
        recipe = repo.find(1)
        expect(recipe.id).to eq "1"
        expect(recipe.name).to eq "Carbonara"
        expect(recipe.cooking_time).to eq "25"
        expect(recipe.rating).to eq "3"
    end
end