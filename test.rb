require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"

sushi = Meal.new({name: 'Sushi', price: 10})
# p bitoque

meal_repo = MealRepository.new("data/meals.csv")

meal_repo.add(sushi)


p meal_repo

