require 'spec_helper'

describe DataHandler do
  before :all do
    @data_handler = DataHandler.new
  end

  describe '#new' do
    it 'returns a DataHandler object' do
      @data_handler.should be_an_instance_of DataHandler
    end
  end

  describe '#import' do
    it 'imports data into the search engine and should handle more than 10000 datasets' do
      12_000.times do
        @data_handler.import
      end
      @data_handler.search_engine.data_set.count.should be > 20_000
    end
  end
end
