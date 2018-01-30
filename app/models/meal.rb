class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end

  # Meal.headers
  def self.headers
    ['id', 'name', 'price']
  end

  def to_csv_row
    [@id, @name, @price]
  end

  def display_in_list
    "#{@id} - #{@name} #{@price}€"
  end
end
