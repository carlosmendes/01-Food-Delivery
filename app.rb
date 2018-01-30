# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require "byebug"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"

require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"

require_relative "router"

meals_repo = MealRepository.new("data/meals.csv")
meals_controller = MealsController.new(meals_repo)

customer_repo = CustomerRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)

router.run
