class SearchEngine
  attr_accessor :data_set, :search_hash

  def initialize
    @data_set = []
    @search_hash = {}
  end

  def add_data(incoming_data_set, incoming_data_set_name)
    incoming_data_set.each do |data|
      data[:data_set_name] = incoming_data_set_name
      add_data_to_search_hash(data)
      add_data_to_data_set(data)
    end
    @data_set
  end

  def find(search_value)
    data_output = []
    data_set_ids = @search_hash[search_value.downcase]
    unless data_set_ids.nil?
      data_set_ids.each do |data_set_id|
        data_output << @data_set[data_set_id]
      end
    end
    data_output
  end

  private

  def add_data_to_search_hash(data)
    data.each_key do |key|
      if data[key].is_a?(Array)
        data[key].each do |element|
          push_data_onto_search_hash(element)
        end
      else
        push_data_onto_search_hash(data[key])
      end
    end
  end

  def push_data_onto_search_hash(value)
    @search_hash[value.to_s.downcase] = [] if @search_hash[value.to_s.downcase].nil?
    @search_hash[value.to_s.downcase] << @data_set.length
  end

  def add_data_to_data_set(data)
    @data_set[@data_set.length] = data
  end
end
