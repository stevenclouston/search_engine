class SearchEngine
  attr_accessor :data_set, :search_hash

  def initialize()
    @data_set = []
    @search_hash = {}
  end

  def add_data(incoming_data_set, incoming_data_set_name)
    incoming_data_set.each do |data|
      data[:data_set_name] = incoming_data_set_name
      add_data_to_search_hash(data)
      add_data_to_data_set(data)
    end
    @data_set.length
  end

  def find(search_value)
    data_output = []
    data_set_ids = @search_hash[search_value]
    unless data_set_ids.nil?
      data_set_ids.each do |data_set_id|
        data_output << @data_set[data_set_id]
      end
    end
    data_output
  end

  private
  def add_data_to_search_hash(data)
    data.keys.each do |key|
      @search_hash[data[key]] = [] if @search_hash[data[key]].nil?
      @search_hash[data[key]] << @data_set.length
    end
  end

  def add_data_to_data_set(data)
    @data_set[@data_set.length] = data
  end
end
