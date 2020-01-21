class OutfitItemsController < ApplicationController
    def index
        @outfit_items = OutfitItem.all 
        render :json => @outfit_items
    end 
end
