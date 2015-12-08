require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'lib/droidealer'


set :port, 80
set :bind, '0.0.0.0'

get '/' do
  
  body = '<pre style="padding:40px; font-size:20px">'
  body += Droidealer.new.random_stats_as_string
  body += '</pre>'

  body

end
