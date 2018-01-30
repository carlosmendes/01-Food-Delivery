require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(repo)
    @repo = repo
    @view = MealsView.new
  end

  def list
    # get info from repo
    meals = @repo.all
    # display the info using View!!!
    @view.display(meals)
  end

  def add
    # name and price from user using View
    name = @view.ask_for("name")
    price = @view.ask_for("price").to_i

    # build the object meal
    meal = Meal.new(name: name, price: price)
    # Add it to the repo
    @repo.add(meal)
    list
  end
end
