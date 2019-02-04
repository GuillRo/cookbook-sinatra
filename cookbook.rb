require 'csv'
require_relative './recipe.rb'

class Cookbook
  attr_reader :recipes
  # this is the repository
  def initialize(csv_class_path)
    @path = csv_class_path
    @recipes = CSV.open(@path).map do |row|
      Recipe.new(name: row[0], ingredients: row[1], prep_time: row[2], difficulty: row[3])
    end
  end

  def all
    # CSV.foreach(book) do |row|
    #   puts "#{row[0]}, a #{row[1]} beer from #{row[2]}"
    # end
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    # CSV method rewrites everything, so i used another one
    update_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def update_csv
    CSV.open(@path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.ingredients, recipe.prep_time, recipe.difficulty]
      end
    end
  end
end