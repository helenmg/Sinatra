require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, 'postgres://gosfvnubzzibih:64b62966723d37a689f958ec9b1d2fc2bd4b4e33160579fde988a410baab9fc8@ec2-54-247-64-64.eu-west-1.compute.amazonaws.com:5432/dbpln2k7uafa35')

class Note
 include DataMapper::Resource
 property :id, Serial
 property :content, Text, :required => true
 property :complete, Boolean, :required => true, :default => false
 property :created_at, DateTime
 property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!

get '/' do
    @notes = Note.all :order => :id.desc
    @title = 'All Notes'
    erb :home
  end

get '/hola' do
  'hola'
end

post '/' do
  n = Note.new
  n.content = params[:content]
  n.created_at = Time.now
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id' do
  @note = Note.get params[:id]
  @title = "Edit note ##{params[:id]}"
  erb :edit
end

put '/:id' do
  n = Note.get params[:id]
  n.content = params[:content]
  n.complete = params[:complete] ? 1 : 0
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/delete' do
  @note = Note.get params[:id]
  @title = "Confirm deletion of note ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  n = Note.get params[:id]
  n.destroy
  redirect '/'
end

get '/:id/complete' do
  n = Note.get params[:id]
  n.complete = n.complete ? 0 : 1 # flip it
  n.updated_at = Time.now
  n.save
  redirect '/'
end
