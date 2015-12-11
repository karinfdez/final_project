class PostsController < ApplicationController
  
  #Posts is nested to his parent: the current user.
  # load_and_authorize_resource :through => :current_user
  # before_action :set_post, only: [:show, :edit, :update, :destroy]


  
  #Adding a private controller method to load the parent object(:user)
  before_filter(:load_user)

  before_action :authenticate_user!,except: [:index,:show,:index_all]

  # GET /posts
  # GET /posts.json
  #Only show posts for the specific user
  def index
    if @user.nil?
      redirect_message
      # @posts = Post.all
    else
      @posts = @user.posts
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
     @post = Post.find_by(id: params[:id]) or redirect_message

  end

  def redirect_message
    redirect_to '/404'
  end

  # GET /posts/new
  def new
    #Helper method load has the before_action method where I don't have
    #to define new post
    if @user.nil?
      redirect_message
    else
      @post = @user.posts.new 
    end

  end

  # POST /posts
  # POST /posts.json
  def create
    #Only the loged user can create posts for himself, not any other user.
    @post = @user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@user,@post], notice: @user.first_name + ', the post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /posts/1/edit
  def edit
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_message
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @user.nil?
      @post=Post.find_by(id: params[:id])
    else
      @post = @user.posts.find(params[:id])
    end
      respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@user, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def index_all
     # @user=User.find_by(id: params[:user_id])
     # @posts = Post.search(params[:search])
     # @posts = Post.order("title ASC").all
    if params[:search_title].present?
      @posts_title = Post.search(params[:search_title]).order("created_at DESC")
    else
      @posts_title= Post.order("created_at DESC")
    end


    if params[:search].present?
      author_search = "%#{params[:search]}%"
      users = User.where("first_name LIKE ? OR last_name like ?", author_search, author_search)
      @posts_title = @posts_title.where(user_id: users.ids)
    end
  end
    
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    #Only administrator remove the posts. Artist only edit them.
    # if @user.nil?
      @post=Post.find_by(id: params[:id])
    # end
    # else
     # @post = @user.posts.find(params[:id])
    # end

    if @post.destroy
    respond_to do |format|
      # if @user.nil?
        # format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      # else
      format.html { redirect_to 'posts', notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
 
  end

  private

  def load_user
    @user=User.find_by(id: params[:user_id])
  end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end
end
