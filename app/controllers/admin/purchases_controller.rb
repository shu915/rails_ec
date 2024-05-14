# frozen_string_literal: true

module Admin
  class PurchasesController < AdminController
    def index
      @purchases = Purchase.all.order(id: :desc).page(params[:page]).per(30)
    end

    def show
      @purchase = Purchase.find(params[:id])
    end
  end
end
