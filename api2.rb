require 'sinatra/contrib'
require 'sinatra/base'
module MyAppModule
  class App <Sinatra::Base
    register Sinatra::Namespace
    namespace '/api/v1' do #2-nd stage namespace
      get "/*" do
        "I don't know what is the #{params[:splat]}. It's what you typed."
      end
      get '/hello/:name' do
        "Hello #{params['name']}!"
      end
      # перенаправление запроса
      get '/redirect' do
        redirect to('hello/World')
      end
      # именованные параметры в качестве переменных блока
      get '/hello/:name' do |n|
        "Hello #{n}!"
      end
      #регулярные выражения
      get %r{/hello/([w]+)} do |c|
        "Hello, #{c}!"
      end
      # использование маски
      get '/say/*/to/*' do
        params['splat'].to_s
      end
      get '/download/*.*' do
        a = params['splat'][0]
        b = params['splat'][1]
        [a,b]
      end
      get'/download/*.*' do |path,ext|
        [path, ext]
      end
      get'/jobs.?:format?' do
      end
    end
  end
end


