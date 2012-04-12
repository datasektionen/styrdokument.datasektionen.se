require 'sinatra'
require 'RedCloth'

class Styrdokument < Sinatra::Base
  set :textile, layout_engine: :erb

  get "/" do
    erb :index, locals: {page: ""}
  end

  get /^\/(stadgar|reglemente)$/ do |document|
    erb :document, locals: {page: document}
  end

  post "/update" do
    `/bin/sh update_styrdokument.sh`
    status 200
    body ""
  end

  get /\/(.*(?:js|css|pdf))/ do |asset|
    send_file "public/#{asset}"
  end
end

