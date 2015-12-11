class UsersController < ApplicationController

 
#Throw an exception if unauthorized user is trying to access this pages.
  #Like an log in user but when not admin preferences.
 # load_and_authorize_resource
  # before_filter :load_user
 
  #Authenticate user when trying to edit, create or modify users(if it's not log in).
  #Unauthorized users only can see artists and theirs blogs.
  before_action :authenticate_user!,except: [:index,:show]
   #Apply this method for this actions.
  before_action :load_user, only: [:show, :edit, :destroy]

  # before_filter :is_admin_user, only: [:index]
  # before_filter :load_user

	def index
		
		# @admins=User.where(admin: true)
	    #Only show users that aren't admin(only the community are shown)
	  @users = User.where(admin: false).order("first_name ASC")

	  if params[:search_user].present?	
	  	#Storing user with capital letter on first letter of name and rest downcase.

       user_search= "#{params[:search_user]}"
       @users= @users.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{user_search}%","%#{user_search}%")
     
     end
    end
	  

	def new
		@user=User.new
	end
	
	def create

		@user = User.create(user_params)

	    respond_to do |format|
	      if @user.save
	      	UserMailer.welcome_email(@user).deliver_now
	        format.html { redirect_to @user, notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user}
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit

  end

  def update
    respond_to do |format|
       @user = User.find_by(id: params[:id])
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def show

	end

	 def destroy
	 	@user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	private
	def load_user
        
        @user = User.find_by(id: params[:id]) or redirect_message
    end

    def redirect_message
      redirect_to '/404'

	end

	def user_params
      params.require(:user).permit(:first_name, :last_name,:image,:email,:users_description,:password, :password_confirmation)

    end
end


