require_relative '../../config/environment'

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
    @name = params[:name]
    @content = params[:content]
    @post = Post.create(name: @name, content: @content)
    @posts = Post.all
    erb :index
    # redirect to '/posts'
  end

    get '/posts' do
      @posts = Post.all
      erb :index
    end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    @name = params[:name]
    @content = params[:content]
    @post = Post.find(params[:id])
    @post.update(name: @name, content: @content)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.all.find(params[:id])
    @post.delete
    # Post.destroy(@post)
    erb :delete
  end

  # add delete button to show page
  # add content to delete controller so it takes button and acts on it
  # sends you to a new page delete.erb that says page has been deleted



end
