require_relative "app/repositories/employee_repository"


employee_repo = EmployeeRepository.new("data/employees.csv")
e = employee_repo.find_by_username("jorge_jesus12")
p e
