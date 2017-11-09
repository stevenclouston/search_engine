require 'json'

class DataHandler
  attr_accessor :search_engine

  def initialize
    @search_engine = SearchEngine.new
  end

  def import
    import_users_data
    import_projects_data
  end

  def import_users_data
    file = File.read('users.json')
    users_data = JSON.parse(file)
    @search_engine.add_data(users_data, 'user')
  end

  def import_projects_data
    file = File.read('projects.json')
    projects_data = JSON.parse(file)
    @search_engine.add_data(projects_data, 'project')
  end
end
