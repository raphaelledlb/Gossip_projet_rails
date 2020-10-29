class CitiesController < ApplicationController
    def index 
        @cities = City.new 
    end 
    
    def show 
        @city = City.find(params['id'])
    end
end
