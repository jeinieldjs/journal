class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:show, :edit, :update, :destroy]
      
    def index
      @categories = current_user.categories
    end
  
    def show
    end
  
    def new
      @category = current_user.categories.build
    end
  
    def create
      @category = current_user.categories.build(category_params)
  
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
      redirect_to dashboard_index_path, notice: 'Successfully deleted the category.'
    end
  
    private
  
    def set_category
      @category = current_user.categories.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title, :description)
    end
  end
  