require 'sinatra'
require 'RedCloth'

class Styrdokument < Sinatra::Base
  get "/" do
    textile :index, layout_engine: :erb, locals: {active_menu_link: ""}
  end

  get "/:document" do |document|
    textile document.to_sym, layout_engine: :erb, locals: {active_menu_link: document}
  end

  post "/update" do
    `/bin/sh update_styrdokument.sh`
    status 200
    body ""
  end
end

