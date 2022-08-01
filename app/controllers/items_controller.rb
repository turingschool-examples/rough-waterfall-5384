class ItemsController < ApplicationController
  def index
    @supermarket = Supermarket.find(params[:id])
    @items = @supermarket.items
  end
end