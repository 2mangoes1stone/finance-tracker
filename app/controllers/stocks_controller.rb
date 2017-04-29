class StocksController < ApplicationController
  def search
    @stock = Stock.find_by_ticker(params[:stock])
    @stock ||= Stock.new_from_lookup(params[:stock])
  end
  if @stock
    render partial: 'lookup'
    # render json: @stock
  else
    render status: :not_found, nothing: true
  end
end
