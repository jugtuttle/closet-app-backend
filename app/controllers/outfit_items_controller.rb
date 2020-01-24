class OutfitItemsController < ApplicationController
    def index
        @outfit_items = OutfitItem.all 
        render :json => @outfit_items
    end 

    def create
        # byebug
        @OutfitItem = OutfitItem.find_or_create_by(item_id: params[:item_id], outfit_id: params[:outfit_id])
        render :json => @OutfitItem
    end

    def destroy
        @outfit_item = OutfitItem.find_by(outfit_id: params[:outfit], item_id: params[:item])
        @outfit_item.delete
    end
end
