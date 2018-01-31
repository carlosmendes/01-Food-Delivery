require_relative "../views/sessions_view"

class SessionsController

  def initialize(employee_repo)
    @view = SessionsView.new
    @employee_repo = employee_repo
  end
  def sign_in
    # ask the user for the username
    username = @view.ask_for("username")
    # ask the user for the password
    password = @view.ask_for("password")
    # get the user from the employee_repo using username
    employee = @employee_repo.find_by_username(username)
    # check if password matches
    if employee && employee.password == password
      @view.print_message("Great! Continue please") # logged in!!!
      employee
    else
      @view.print_message("Wrong login!!!! Try again!") # not logged in!!!
      sign_in # calling the same method -> recursive method, it calls itself
    end
  end
end
