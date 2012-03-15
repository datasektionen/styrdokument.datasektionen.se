require 'sinatra'
require 'RedCloth'

class Styrdokument < Sinatra::Base
  set :textile, layout_engine: :erb

  get "/" do
    textile :index, locals: {active_menu_link: ""}
  end

  get /^\/(stadgar|reglemente)$/ do |document|
    textile document.to_sym, locals: {active_menu_link: document}
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

