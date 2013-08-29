class RecipesController < ApplicationController
  def index
    @recipes = [
      Recipe.new({
        id: 1,
        title: "Vegetable Chinese Don",
        description: "This is a Chinese style Don with a lot of different vegetables.",
        rating: 3.0
      }),
      Recipe.new({
        id: 2,
        title: "Mixed Rice with Spicy Spinach",
        description: "Rice mixed with butter sauteed spinach and Vienna sausages. A dab of Gochujang paste adds an appetite-whetting spiciness.",
        rating: 2.1
      }),
      Recipe.new({
        id: 3,
        title: "Just Mix for 3 Minutes. Scrambled Eggs with Corn",
        description: "Just mix to make this sweet corn scrambled egg dish. Use fresh corn in the summer for an even sweeter flavor.",
        rating: 2.9
      })
    ]
  end

  def popular
    @recipes = [
      Recipe.new({
        id: 1,
        title: "Vegetable Chinese Don",
        description: "This is a Chinese style Don with a lot of different vegetables.",
        rating: 3.0
      }),
      Recipe.new({
        id: 2,
        title: "Mixed Rice with Spicy Spinach",
        description: "Rice mixed with butter sauteed spinach and Vienna sausages. A dab of Gochujang paste adds an appetite-whetting spiciness.",
        rating: 2.1
      }),
      Recipe.new({
        id: 3,
        title: "Just Mix for 3 Minutes. Scrambled Eggs with Corn",
        description: "Just mix to make this sweet corn scrambled egg dish. Use fresh corn in the summer for an even sweeter flavor.",
        rating: 2.9
      })
    ].sort { |a, b| a.rating <=> b.rating }
  end

  def show
    @recipe = Recipe.new({
      title: "Fail-Proof! Sweet and Sour Shiitake and Deep Fried Tofu Stir-Fry",
      description: "Just use ready-made mentsuyuu (Japanese noodle dipping sauce). An easy recipe for backelors.",
      ingredients: [
        Ingredient.new({title: "Atsu-age (thick deep-fried tofu)", amount: "1/2 block"}),
        Ingredient.new({title: "Shiitake mushrooms", amount: "2 to 3"})
      ],
      steps: [
        Step.new({number: 1, description: "Cut the chicken thigh meat into bite sizes. Discard the stems of the shiitake mushrooms and cut it half."}),
        Step.new({number: 2, description: "Heat the vegetable oil in a pan over a high heat and fry the chicken with the skin side down. After both sides are nicely browned add the shiitake mushrooms and fry."}),
        Step.new({number: 3, description: "Add the sauce ingredients and shake the pan gently. Simmer over a medium heat for about 3 minutes and serve."})
      ],
      rating: 3.0
    })
  end
end
