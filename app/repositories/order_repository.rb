require_relative "base_repository"
require_relative "../models/order"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repo, customer_repo, employee_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    super(csv_file) # calling the initialize method of BaseRepository
    # @csv_file = csv_file
    # @elements = []
    # @next_id
    # load_csv
  end


  def undelivered_orders
    @elements.select {|order| order.delivered? == false}
  end

  def employee_undelivered_orders(employee)
    @elements.select {|order| order.delivered? == false && order.employee.id == employee.id}
  end
  private

  def build_object(row)
    # row = {id: "1", delivered: "true", meal_id: "2", customer_id: 1}
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == "true"
    row[:meal] = @meal_repo.find(row[:meal_id])
    row[:customer] = @customer_repo.find(row[:customer_id])
    row[:employee] = @employee_repo.find(row[:employee_id])
    # row = {id: 1, delivered: true, meal: meal_object, customer_id: 1}
    Order.new(row)
  end
end
