class SessionsController < ApplicationController
    include SessionsHelper
    def new
        @user = User.new
    end

    def create
        @user=User.new(post_params)
        user = User.find_by(email: params['email'])
      
        
        if user && user.authenticate(params['password'])
            log_in(user)
            puts "auth ok"
          redirect_to root_path
      
        else
            puts "errrorrrrr"
          flash.now[:danger] = 'Invalid email/password combination'
          render "new"
        end
      end

    def destroy
        session.delete(current_user)
    end

    private

    def post_params
      post_params = params.permit(:email, :password)
    end
end

