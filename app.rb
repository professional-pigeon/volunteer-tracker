require "sinatra"
require "sinatra/reloader"
require "pry"
require "pg"
require "./lib/project"
require "./lib/volunteer"
also_reload "lib/**/*.rb"

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do 
  @projects = Project.all
  erb(:main)
end

post('/projects') do
  proj_obj = Project.new({:title => params[:project_title], :id => nil})
  proj_obj.save
  redirect to ('/')
end

get('/project/:id') do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  erb(:project)
end

patch('/project/:id/edit') do
  project = Project.find(params[:id].to_i)
  project.update({:title => params[:project_title], :id => nil})
  redirect to("/project/#{project.id}")
end

delete('/project/:id/delete') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect to('/')
end

post('/project/:id/add_vol') do
  volunteer = Volunteer.new(:name => params[:name], :id => nil, :project_id => params[:id])
  volunteer.save
  redirect to("/project/#{volunteer.project_id}")
end

get('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id])
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end

patch('/volunteer/:id/edit') do
  volunteer = Volunteer.find(params[:id])
  volunteer.update({:name => params[:name], :id => nil})
  redirect to("/project/#{volunteer.project_id}")
end

delete('/volunteer/:id/delete') do
  volunteer = Volunteer.find(params[:id].to_i)
  project_id = volunteer.project_id
  volunteer.delete
  redirect to("/project/#{project_id}")
end