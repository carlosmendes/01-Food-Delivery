require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository
  private

  def build_object(row)
    # row = {id: "1", name: "Carlos", address: "You whish!!!"}
    row[:id] = row[:id].to_i
    Customer.new(row)
  end
end
