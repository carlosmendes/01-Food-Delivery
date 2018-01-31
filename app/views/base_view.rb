class BaseView
  def display(elements)
    # elements is an array of??? orders
    elements.each do |element|
      puts element.display_in_list #element
    end
  end

  def ask_for(attribute)
    puts "What is the #{attribute}?"
    print "> "
    gets.chomp
  end
end
