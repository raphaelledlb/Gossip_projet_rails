class UsersController < ApplicationController
    def new
        @user = User.new
    end
   
    def create
        @user = User.new(first_name: params[:first_name], last_name: params[:last_name],
       email: params[:email], description: params[:description], age: params[:age], 
       password: params[:password], city: City.all.sample)

        if @user.save
            puts "user ok"
            session[:success] = "Création de compte validée"
            session[:user_id] = @user.id
            redirect_to gossips_path
          else
            puts "error user"
            redirect_to new_user_path
        end
         
    end

    def show
        @user = User.where(first_name = params[:first_name])
    end

private

    def post_params
        post_params = params.require(:user).permit(:first_name, :last_name, :age, :description, :email, :password)
    end
end


