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