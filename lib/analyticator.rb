require 'sinatra'
require 'rubygems'
require 'analyticator/version'
class Analyticator < Sinatra::Application

  configure do
    set :static, true
    set :public, File.expand_path('../public', __FILE__)

    set :views,  File.expand_path('../views', __FILE__)
    set :haml, { :format => :html5 }
    set :port, 8080
    @@events ||= []
  end

  get '/' do
    @events = @@events
    haml :index
  end
  get '/test' do
    puts "#{@@events}"
  end
  get '/__utm.gif' do
    unless params[:utmt].nil?
      options = params[:utme] || ""
      if params[:utmt] == "event"
        options = options.split("(")
        arr = []
        options.each{|o| arr << o.split(")") }
        arr = arr.flatten
        arr.reject!{|o| o == '' }
        details = arr[1].split("*")
        options = {
          :action => details[0],
          :location => details[1],
          :label => details[2],
          :value => arr[2],
          created_at: Time.now
        }
        @@events << options
      end
    end
    content_type :gif
    puts ""
  end
  get '/ga.js' do
    uri = URI.parse("http://www.google-analytics.com/ga.js")
    response = Net::HTTP.get_response(uri)
    local = "http://" + self.request.host + ":" + self.request.port.to_s
    body = response.body.gsub(/http(.*?)google-analytics.com/, local).gsub('www.google-analytics.com', local)
    render js: body, :content_type => "text/javascript"
  end
end