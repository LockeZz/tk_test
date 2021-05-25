class RecipeController < ApplicationController
    
    def index 
        @recipes = Recipe.all
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new 
        @recipe.ingredients.build
    end

    def create 
        @recipe = Recipe.new(recipe_param)
        if params[:add_ingredient] 
            @recipe.ingredients.build 
        elsif params[:remove_ingredient]
            # nested model that have _destroy attribute = 1 automatically deleted by rails
        else 
            if @recipe.save 
                flash[:notice] = "Successfully created recipe"
                redirect_to recipe_index_path
            else
                render :action => 'new'
            end
        end
    end

    def edit 
        @recipe = Recipe.find(params[:id])
    end

    def update 
        @recipe = Recipe.find(params[:id])
        if params[:add_ingredient]
            unless params[:recipe][:ingredients_attributes].blank?
                for attribute in params[:recipe][:ingredients_attributes] 
                    @recipe.ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
                end
            end
            @recipe.ingredients.build
        elsif params[:remove_ingredient]
            removed_ingredients = params[:recipe][:ingredients_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1)}
            Ingredient.delete(removed_ingredients)
            flash[:notice] = "Ingredients removed."
            for attribute in params[:recipe][:ingredients_attributes] 
                @recipe.ingredients.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
            end
        else
            if @recipe.update_attributes(params[:recipe])
                flash[:notice] = "Successfully updated recipe"
                redirect_to @recipe and return
            end
        end
        render :action => 'edit'
    end

    def destroy 
        @recipe = Recipe.find(params[:id])
        @recipe.destroy 
        flash[:notice] = "Successfully destroyed recipe."
        redirect_to recipes_url
    end

    private 

    def recipe_param
        params.require(:recipe).permit(:name, :description, :ingredients_attributes => [:name])
    end
end
