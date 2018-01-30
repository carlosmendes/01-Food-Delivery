require_relative "base_repository"
require_relative "../models/meal"

class MealRepository < BaseRepository

  private

  def build_object(row)
    # row = {id: "1", name: "Bitoque", price: "10"}
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end
end
