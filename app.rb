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