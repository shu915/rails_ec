# frozen_string_literal: true

module Admin
  class ProductsController < AdminController
    before_action :set_product, only: %w[edit update destroy]

    def index
      @products = Product.with_attached_image.order(created_at: :desc).page(params[:page]).per(8)
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "#{@product.name}を新規追加しました。"
        redirect_to admin_products_path
      else
        flash[:errors] = @product.errors.full_messages
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        flash[:notice] = "#{@product.name}を更新しました。"
        redirect_to admin_products_path
      else
        flash[:errors] = @product.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy
      flash[:notice] = "#{@product.name}を削除しました。"
      redirect_to admin_products_path
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price, :discouted_price, :sku, :image)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
