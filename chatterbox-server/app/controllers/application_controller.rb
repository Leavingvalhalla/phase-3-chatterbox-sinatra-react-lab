class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    messages = Message.all.order('created_at asc')
    messages.to_json
  end

  post '/messages' do
    message = {
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at]
    }
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body], updated_at: [:updated_at])
  end

  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
  end

end
