require 'rubygems'
require 'sinatra'

invitaciones = []

get '/' do
  erb :home
end

post '/invitacion' do
  novio = params["name1"] 
  novia = params["name2"]
  fecha = params["date"]
  id = invitaciones.count
  @invitacion = Invitaciones.new(novio, novia, fecha, id)

  invitaciones << @invitacion

  erb :invitacion
end  

get '/invitacion/:id' do
  id = params["id"].to_i
  @invitacion = invitaciones[id]
  erb :invitacion
end

get '/lista' do 
  @invitaciones = invitaciones
    erb :lista  
end

class Invitaciones
  attr_reader :novio, :novia, :fecha, :id

  def initialize(novio, novia, fecha, id)
    @novio = novio.capitalize #varaible de instancia
    @novia = novia.capitalize
    @fecha = fecha
    @id = id
  end
end

