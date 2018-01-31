class Order
  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
  end

  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

   # Meal.headers
  def self.headers
    ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end

  def display_in_list
    "#{@id} #{@customer.name} - #{@meal.name} #{@employee.username}"
  end
end
