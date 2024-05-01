# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.order(id: :desc).limit(4)
  end
end
