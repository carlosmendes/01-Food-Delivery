require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist? csv_file
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def all
    @elements
  end

  private

  def save_csv
    return if @elements.empty?
    CSV.open(@csv_file, 'w') do |csv|
      csv << @elements.first.class.headers # return names of attributes ['id', 'name', 'price']
      @elements.each do |element|
        csv << element.to_csv_row # return values [element.id, element.name, element.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_object(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end
