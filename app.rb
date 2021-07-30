require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "pry"
require "pg"
require "./lib/project"
require "./lib/volunteer"

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do 
  @projects = Project.all
  erb(:main)
end