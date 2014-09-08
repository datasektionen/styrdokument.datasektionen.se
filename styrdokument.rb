require 'sinatra'
require 'RedCloth'

class Styrdokument < Sinatra::Base
  set :textile, layout_engine: :erb

  get "/" do
    erb :index, locals: {page: ""}
  end

  get /^\/(stadgar|reglemente|ekonomiskt_styrdokument|alkoholpolicy)$/ do |document|
    file = File.dirname(__FILE__) + "/views/#{document}.textile"
    textile RedCloth.new(File.read(file, encoding: 'utf-8'))
  end

  post "/update" do
    `./update_styrdokument.sh`
    status 204
  end

  get /\/(.*(?:js|css|pdf))/ do |asset|
    send_file "public/#{asset}"
  end
end

