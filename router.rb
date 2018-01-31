# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.sign_in
    loop do
      # print menu
      @employee.manager? ? print_menu_manager : print_menu_delivery_guy
      # ask for action
      action = ask_for_action
      # route user
      @employee.manager? ? route_user_manager(action) : route_user_delivery_guy(action)
    end
  end

  private

  def print_menu_manager
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. List undelivered orders"
    puts "6. Add new order"
  end

  def print_menu_delivery_guy
    puts "1. My undelivered orders"
    puts "2. Mark order as delivered"
  end

  def ask_for_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end

  def route_user_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    end
  end

  def route_user_delivery_guy(action)
    case action
    when 1 then @orders_controller.list_my_undelivered_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    end
  end
end

