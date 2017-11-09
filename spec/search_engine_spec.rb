require 'spec_helper'

describe SearchEngine do
  before :all do
    @data_hash = get_data_hash
    @search_engine = SearchEngine.new
  end

  describe "#new" do
      it "Returns a SearchEngine object" do
          @search_engine.should be_an_instance_of SearchEngine
      end
  end

  describe "#add_data" do
    it "adds three hashes to then search engine" do
        @search_engine.add_data(@data_hash, 'project').length.should eql 3
    end
  end

  describe "#find" do
    let(:return_array) { [{:_id=>101, :url=>"http://example.com/projects-1", :external_id=>"9270ed79-35eb-4a38-a46f-35725197ea8d", :name=>"My first project",
      :tags=>["Exterior", "Workplace Fun"], :created_at=>"2016-05-21T11:10:28 -10:00", :data_set_name=>"project"}] }
    it "returns the return_array from search engine" do
      expect(@search_engine.find("9270ed79-35eb-4a38-a46f-35725197ea8d")).to eq(return_array)
    end

    it "returns two hashes when the name My first project is searched" do
      @search_engine.find("My first project").count.should eql 2
    end

    it "returns two hashes when the name my first project is searched" do
      @search_engine.find("my first project").count.should eql 2
    end

    it "returns an empty array when the search value is not found" do
      @search_engine.find("my first project_1").should eql []
    end

    it "returns the return_array when the tag Exterior is searched" do
      expect(@search_engine.find("Exterior")).to eq(return_array)
    end
  end

  def get_data_hash
    [
      {
        "_id": 101,
        "url": "http://example.com/projects-1",
        "external_id": "9270ed79-35eb-4a38-a46f-35725197ea8d",
        "name": "My first project",
        "tags": [
          "Exterior",
          "Workplace Fun"
        ],
        "created_at": "2016-05-21T11:10:28 -10:00"
      },
      {
        "_id": 103,
        "url": "http://example.com/projects-2",
        "external_id": "7cd6b8d4-2999-4ff2-8cfd-44d05b449226",
        "name": "My first project",
        "location": [
          "Melbourne",
          "Singapore"
        ],
        "created_at": "2016-04-07T08:21:44 -10:00",
        "details": "Non profit",
        "published": false,
        "tags": [
          "Trevino"
        ]
      },
      {
        "_id": 102,
        "url": "http://example.com/projects-2",
        "external_id": "7cd6b8d4-2999-4ff2-8cfd-44d05b449226",
        "name": "Project with HP",
        "location": [
          "Melbourne",
          "Singapore"
        ],
        "created_at": "2016-04-07T08:21:44 -10:00",
        "details": "Non profit",
        "published": false,
        "tags": [
          "Trevino"
        ]
      }

    ]
  end
end
