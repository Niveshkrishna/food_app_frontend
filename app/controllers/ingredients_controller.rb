class IngredientsController < ApplicationController
   def index
    @ingredients = Ingredient.where(recipe_id: params[:recipe_id]).to_a
=begin    imageUrls = {}    
    @ingredients.each do |x|
        imageUrls[x.id] = imageUrl(x) if x.image.exists?
=end    end
    if @ingredients != nil
        render :json => @ingredients #, imageUrls: imageUrls}
    else
        head :no_content
    end 
   end
   
   def create
     @ingredient = Ingredient.new(ingredient_params)
     
     if @ingredient.save
            render :json => @ingredient
        else
            render :json => @ingredient.errors
        end 
   end
   
   def show
    @ingredient = Ingredient.find_by_id(params[:id])
    if @ingredient != nil
            render :json => @ingredient
        else
            render :json => {not_found: trues}
        end 
   end
   
   def update
       @ingredient = Ingredient.find_by_id(params[:id])
      if @ingredient != nil
        if @ingredient.update(ingredient_params)
            render :json => @ingredient
        else
            render :json => @ingredient.errors.messages
        end
      else
        render :json => {not_found: trues}
      end 
   end
   
   def destroy
        @ingredient = Ingredient.find_by_id(params[:id])
        if @ingredient.destroy
          render :json => {deleted: true}
        else
          render :json => {deleted: false}
        end
   end
   
   private
   
   def ingredient_params
        params.permit(:recipe_id, :id, :content, :image) 
   end
   
  
end
