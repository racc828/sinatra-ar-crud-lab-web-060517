require_relative '../../config/environment'
require "pry"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post = Post.new(name: params[:name], content: params[:content])
    @new_post.save
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    @post.destroy
    erb :delete 
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.update(params[:post])
    redirect "/posts/#{params[:id]}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end


  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end





end
