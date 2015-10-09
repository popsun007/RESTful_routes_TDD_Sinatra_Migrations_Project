require 'sinatra'
require 'active_record'
ENV['SINATRA_ENV'] ||= 'development'
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
class Project < ActiveRecord::Base
end
get '/' do
  'Welcome to my portfolio'
end

get '/projects' do
  @projects = Project.all
  erb :'projects/index'
end

get '/projects/new' do
  erb :'projects/new'
end

post '/projects' do
  Project.create(name: params[:Name], description: params[:Description])
  redirect '/projects'
end

get '/projects/:id' do
  @project = Project.find(params[:id])
  erb :'projects/show'
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id])
  erb :'projects/edit'
end

patch '/projects/:id' do
  project = Project.find(params[:id])
  project.update(name: params[:Name], description: params[:Description])
  redirect '/projects'
end

delete "/projects/:id" do
  Project.find(params[:id]).destroy
  redirect "/projects"
end



