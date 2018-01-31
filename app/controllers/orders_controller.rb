require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
    @view = OrdersView.new
  end

  def list_undelivered_orders
    # get the orders that are undelivered!
    undelivered_orders = @order_repo.undelivered_orders
    # print them!
    @view.display(undelivered_orders)
  end

  def list_my_undelivered_orders(employee)
    # get the orders that are undelivered!
    my_undelivered_orders = @order_repo.employee_undelivered_orders(employee)
    # print them!
    @view.display(my_undelivered_orders)
  end

  def mark_as_delivered(employee)
    # list them
    list_my_undelivered_orders(employee)
    # ask the user the id of the order
    order_id = @view.ask_for("order id")
    # get the order
    order = @order_repo.find(order_id)
    # mark it as done!
    order.deliver!
    # save to csv
    @order_repo.save_csv
  end

  def add
    # ask for meal_id,employee_id,customer_id
    meal_id = @view.ask_for("meal id")
    employee_id = @view.ask_for("employee id")
    customer_id = @view.ask_for("customer id")
    meal = @meal_repo.find(meal_id)
    employee = @employee_repo.find(employee_id)
    customer = @customer_repo.find(customer_id)
    # create a new order
    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    # add it to the repo
    @order_repo.add(new_order)
  end


end
