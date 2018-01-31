# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run
    @employee = @sessions_controller.sign_in
    loop do
      # print menu
      print_menu
      # ask for action
      action = ask_for_action
      # route user
      route_user(action)
    end
  end

  private

  def print_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. List undelivered orders"
    puts "6. Add new order"
    puts "7. My undelivered orders"
    puts "8. Mark order as delivered"
  end

  def ask_for_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end

  def route_user(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then puts "TODO"
    when 6 then puts "TODO"
    when 7 then puts "TODO"
    when 8 then puts "TODO"
    end
  end
end

