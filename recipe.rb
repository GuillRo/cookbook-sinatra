class Recipe
  # this is the model (data stored)
  attr_accessor :name, :ingredients, :prep_time, :difficulty
  def initialize(args)
    @name = args[:name]
    @ingredients = args[:ingredients]
    @prep_time = args[:prep_time]
    @difficulty = args[:difficulty]
  end
end