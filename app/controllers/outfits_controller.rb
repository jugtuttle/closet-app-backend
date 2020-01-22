class OutfitsController < ApplicationController
    def index
        @outfits = Outfit.all 
        render :json => @outfits
    end 

    def new 
        @outfit = Outfit.new
    end 

    def edit 
        @outfit = Outfit.find(params[:id])
    end 

    def create 
        @outfit = Outfit.new(outfit_params)
        if @outfit.create
            render :json => @outfit
        else 
            NULL
            ### needs error handling
        end  
    end 

    def update 
        @outfit = Outfit.find(params[:id])
        if @outfit.update
            render :json => @outfit
        else 
            NULL 
            ### needs error handling 
        end 
    end 

    def destroy
        @outfit = Outfit.find(params[:id])
        @outfit.destroy 
    end

    private 

    def outfit_params 
        params.require(:outfit).permit(:name)
    end
end
