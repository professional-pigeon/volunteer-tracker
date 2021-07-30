class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    attributes.each {|pair| instance_variable_set("@#{pair[0].to_s}", pair[1])}
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def ==(proj_to_compare)
    self.title == proj_to_compare.title
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end




end