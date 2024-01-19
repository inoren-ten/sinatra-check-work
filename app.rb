require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

get '/' do
  @title = 'ホーム | テックチャット'
  @posts = Posts.all
  erb :index
end

get '/post/new' do
  @title = '投稿する | テックチャット'
  erb :post_new
end

post '/post/create' do
  name = params[:name]
  body = params[:body]
  unless name == "" && body == ""
    Posts.create({:name => name, :body => body})
    redirect "/"
  end
end

get '/post/edit/:id' do
  @title = '投稿を編集する | テックチャット'
  @post = Posts.find(params[:id])
  erb :post_edit
end

post '/post/update/:id' do
  @post = Posts.find(params[:id])
  @post.name = params[:name]
  @post.body = params[:body]
  
  if @post.save
    redirect '/'
  end
end

post '/post/delete/:id' do
  @post = Posts.find(params[:id])
  if @post.destroy
    redirect '/'
  end
end