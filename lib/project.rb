class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    attributes.each {|pair| instance_variable_set("@#{pair[0].to_s}", pair[1])}
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |projects|
      name = project.fetch("name")
      id = project.fetch("id").to_i
      project.push(Album.new({ :title => title, :id => id}))
    end
    project
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end




end