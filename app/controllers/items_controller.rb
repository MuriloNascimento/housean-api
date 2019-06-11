# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :set_item, only: %w[show update destroy]

  # GET /items
  def index
    @items = Item.all
    @items = @items.purchase if params['f'].present? && params['f'].eql?('purchase')
    paginate json: @items, methods: ['amount_purchase'], per_page: 10
  end

  # POST /items
  def create
    @item = Item.create(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # GET /items/:id
  def show
    render json: @item
  end

  # PUT /items/:id
  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/:id
  def destroy
    if @item.destroy
      head :no_content
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

  def item_params
    # whitelist params
    params.permit(:name, :category_id, :price, :amount, :minimum_amount)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end