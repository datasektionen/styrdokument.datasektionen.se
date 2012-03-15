require File.dirname(__FILE__) + '/styrdokument.rb'

use Rack::ShowExceptions

run Styrdokument.new

