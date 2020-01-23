class OutfitItemsController < ApplicationController
    def index
        @outfit_items = OutfitItem.all 
        render :json => @outfit_items
    end 

    def destroy
        @outfit_item = OutfitItem.find_by(outfit_id: params[:outfit], item_id: params[:item])
        @outfit_item.delete
    end
end
