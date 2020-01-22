class ItemsController < ApplicationController
    def index 
        @items = Item.all 
        render :json => @items 
    end

    def new 
        @item = Item.new
    end 

    def edit 
        @item = Item.find(params[:id])
    end

    def show 
        @item = Item.find(params[:id])
    end 
    
    def create 
        @item = Item.new(item_params)
        if @item.create
        render :json => @item 
        else 
            NULL #### needs error handling 
        end 
    end 

    def update 
        @item = Item.find(params[:id])
        if @item.update 
            render :json => @item 
        else 
            NULL #### needs error handling 
        end
    end 

    def destroy
        @item = Item.find(params[:id])
        @item.destroy 
    end

    private 

    def item_params
        params.require(:item).permit(:image_url, :name, :times_worn, :favorite, :user_id)
    end

end
