require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(repo)
    @repo = repo
    @view = CustomersView.new
  end

  def list
    customers = @repo.all
    @view.display(customers)
  end

  def add
    name = @view.ask_for("name")
    address = @view.ask_for("address")
    customer = Customer.new(name: name, address: address)
    @repo.add(customer)
  end
end
