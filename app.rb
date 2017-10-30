require 'rubygems'
require 'sinatra'

class App < Sintra::Base 
  attr_reader :novio, :novia, :fecha

  def initialize(novio, novia, fecha)
    @novio = novio.capitalize #varaible de instancia
    @novia = novia.capitalize
    @fecha = fecha
  end

  get '/' do
    erb :home
  end
  
  get '/invitaciones' do
    novio = params["name1"] 
    novia = params["name2"]
    fecha = params["date"]
    @invitacion = Invitaciones.new(novio, novia, fecha)
    erb :invitaciones
  end  
end

