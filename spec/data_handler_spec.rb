require 'spec_helper'
require 'byebug'

describe DataHandler do
  before :all do
    @data_handler = DataHandler.new
  end

  describe "#new" do
      it "returns a DataHandler object" do
          @data_handler.should be_an_instance_of DataHandler
      end
  end

  describe "#import" do
      it "imports data into the search engine" do
          @data_handler.import
          @data_handler.search_engine.data_set.count.should be > 0
      end
  end
end
