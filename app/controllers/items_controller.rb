class ItemsController < ApplicationController
  def index
    @supermarket = Supermarket.find(params[:supermarket_id])
    @items = @supermarket.items
  end
end