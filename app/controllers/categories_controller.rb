# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %w[show update destroy]

  # GET /categories
  def index
    @categories = Category.all
    paginate json: @categories, per_page: 10
  end

  # POST /categories
  def create
    @category = Category.create(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # GET /categories/:id
  def show
    render json: @category
  end

  # PUT /categories/:id
  def update
    if @category.update(category_params)
      head :no_content
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:id
  def destroy
    if @category.destroy
      head :no_content
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private

  def category_params
    # whitelist params
    params.permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end