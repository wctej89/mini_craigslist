get '/' do
  @categories = Category.all
  # Look in app/views/index.erb
  erb :index
end

get '/new' do
  @categories = Category.all
  erb :new_post
end

post '/new' do
  p params
  post = Post.create(params[:post])
  session[:temp_key] = post.key
  redirect "/#{post.category.name}/#{post.id}"
end

post '/update' do
  params[:post][:description] = params[:post][:description].strip
  post = Post.update(params[:id], params[:post])
  category = Category.find_by_id(post.category_id)
  redirect "/#{category.name}/#{post.id}"
end

get '/:post_id/edit' do
  @categories = Category.all
  @post = Post.find_by_key(params[:key])
  p @post
  @category = Category.find(@post.category_id)
  erb :edit
end


get '/:category_name/:post_id' do |category_name, post_id|
  @temp_key = session.delete(:temp_key) if session[:temp_key]
  @category = Category.find_by_name(category_name)
  @post = Post.find(post_id)
  erb :view_post
end

get '/:category_name' do |category_name|
  @category = Category.find_by_name(category_name)
  @posts = @category.posts
  erb :list_posts
end 

delete '/:id' do
  post = Post.find(params[:id])
  category = Category.find(post.category_id)
  post.destroy
  redirect "/#{category.name}"
end





