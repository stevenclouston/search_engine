require 'spec_helper'

describe UserInterface do
  before :all do
    @user_interface = UserInterface.new
  end

  describe '#new' do
    it 'Returns a UserInterface object' do
      @user_interface.should be_an_instance_of UserInterface
    end

    it 'Returns a DataHandler object' do
      @user_interface.data_handler.should be_an_instance_of DataHandler
    end
  end
end
