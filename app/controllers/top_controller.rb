class TopController < ApplicationController
    def main
        if session[:id]
            render "products"
        else
            render "login"
        end
    end
    
    def login
        user = User.find_by(name: params[:user][:name])
        if user
            session[:name] = user.name
            redirect_to products_path
        else
            render "login"
        end
    end
    
    def logout
        session.delete(:id)
        redirect_to top_main_path
    end 
end
