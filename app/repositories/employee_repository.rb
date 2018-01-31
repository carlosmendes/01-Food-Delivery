require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository

  # undef add method

  def find_by_username(username)
    @elements.find{|employee| employee.username == username}
  end

  private

  def build_object(row)
    # row = {id: "1", username: "Carlos", password: "You whish!!!", role: "manager"}
    row[:id] = row[:id].to_i
    Employee.new(row)
  end
end
