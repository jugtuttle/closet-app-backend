class ItemsController < ApplicationController
    def index 
        @items = Item.all 
        render :json => @items 
    end

    # def new 
    #     @item = Item.new
    # end 

    # def edit 
    #     @item = Item.find(params[:id])
    # end

    def show 
        @item = Item.find(params[:id])
    end 
    
    def create 
        @item = Item.new(item_params)
        cat_ids = params[:category_ids]
        # byebug
        if @item.save
            cat_ids.each do |cat|
                @category = ItemCategory.new(category_id: cat, item_id: @item.id)
                @category.save
            end 
        render :json => @item 
        else 
            "NULL" ## needs error handling
        end 
    end 

    def update 
        @item = Item.find(params[:id])
        # byebug
        if params[:category_ids]
            cat_ids = params[:category_ids]
            @old_categories = ItemCategory.where(item_id: @item.id)
            old_categories_ids = @old_categories.map {|c| c.category_id}
            # byebug 
            if @item.update(item_params)
                old_categories_ids.each do |old_cat| 
                    if !cat_ids.include?(old_cat)
                        @cat_to_delete = ItemCategory.find_by(category_id: old_cat, item_id: @item.id)
                        @cat_to_delete.destroy 
                    end 
                end 
                @item.save 
                render :json => @item 
            else 
                NULL #### needs error handling 
            end
        else 
            if @item.update(item_params)
                render :json => @item 
            else 
                NULL #### needs error handling 
            end 
        end 
    end 

    def destroy
        # byebug
        @item = Item.find(params[:id])
        @outfit_items = OutfitItem.where(item_id: @item)
        @outfit_items.destroy_all
        @item_categories = ItemCategory.where(item_id: @item)
        @item_categories.destroy_all
        @item.destroy 
    end

    private 

    def item_params
        # params[:item][:categories] || = []
        params.require(:item).permit(:id, :image_url, :name, :times_worn, :favorite, :user_id, :categories, category_ids: [],)
    end

end
