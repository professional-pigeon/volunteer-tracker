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

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:title => title, :id => id})
    else
      false
    end
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id) || @id
    DB.exec("UPDATE projects SET title = '#{title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{@id};")
  end

  def volunteers
    vols = []
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{id};")
    results.each do |result|
      project_id = result.fetch("project_id").to_i
      name = result.fetch("name")
      id = result.fetch("id")
      vols.push(Volunteer.new({ :name => name, :id => id, :project_id => project_id}))
    end
    vols
  end


end