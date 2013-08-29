class Ingredient
  attr_accessor :title, :amount

  def initialize(attrs = {})
    @title = attrs[:title]
    @amount = attrs[:amount]
  end
end
