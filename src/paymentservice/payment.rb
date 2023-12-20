require 'sinatra'

set :port, 3333
set :bind, '0.0.0.0'

get '/' do
  content_type :json
  { ruby: "payment service" }.to_json
end
