require_relative 'search_engine'
require_relative 'data_handler'

class UserInterface
  attr_accessor :data_handler

  def initialize
    @data_handler = DataHandler.new
    @data_handler.import
  end

  def launch!
    introduction
    result = nil
    until result == 'quit'
      search_string = search_value
      result = do_action(search_string)
    end
    conclusion
  end

  private

  def search_value
    puts 'Enter a search value:'
    user_response = gets.chomp
  end

  def do_action(search_string)
    unless search_string == 'quit'
      returned_data = @data_handler.search_engine.find(search_string)
      print_data(returned_data)
    end
    search_string
  end

  def print_data(data)
    if data.count.zero?
      puts 'No results!'
    else
      puts "Your search returned #{data.count} result(s):"
      puts '-----------------------------------------------------'
      data.each do |hash|
        puts "Data Type: #{hash[:data_set_name].split(' ').map(&:capitalize).join(' ')}"
        puts(hash.map { |k, v| "#{k}: #{v}" }.sort)
        puts '-----------------------------------------------------'
      end
    end
  end

  def introduction
    puts "\n\n<<< Welcome to the project and user search engine >>>\n\n"
    puts "This is a search engine to help you search for projects and users. Type 'quit' at any time to exit.\n\n"
  end

  def conclusion
    puts "\n\n<<< Thank you for using the search engine >>>\n\n"
  end
end
