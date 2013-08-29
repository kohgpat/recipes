class Recipe
  attr_accessor :id, :title, :description, :ingredients, :steps, :rating

  def initialize(attrs = {})
    @id = attrs[:id]
    @title = attrs[:title]
    @description = attrs[:description]
    @ingredients = attrs[:ingredients]
    @steps = attrs[:steps]
    @rating = attrs[:rating]
  end
end
