require 'sinatra'
require 'haml'
require 'sass'
require File.dirname(__FILE__) + '/app/models/calculator'

set :views, File.dirname(__FILE__) + '/app/views'
set :public, File.dirname(__FILE__) + '/public'

get '/' do
  @calculator = Calculator.new
  @banheiro = @calculator.select('banheiro')
  @refeitorio = @calculator.select('refeitorio')
  @onibus = @calculator.select('onibus')
  @bebedouro = @calculator.select('bebedouro') 
  @entrada_principal = @calculator.select('entrada_principal')
  @entrada_camping = @calculator.select('entrada_camping')
  haml :index
end

get '/stylesheets/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :application
end
