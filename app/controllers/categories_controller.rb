class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    
    def index
        @categories = Category.all
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to category_path(@category), notice: 'Successfully created new category'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @category.update(category_params)
            redirect_to category_path(@category), notice: 'Successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path, notice: 'Successfully deleted the category.'
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:title, :description)
    end
end
