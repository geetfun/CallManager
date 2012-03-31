class TokensController < ApplicationController
  
  respond_to :json
  
  def create
    @stock = current_user.stocks.new(params[:stock])
    if @stock.save
      flash[:notice] = "Stock added"
    end
    respond_with(@stock)
    
    @token = Token.new(params[:token])
    @token.generate
  end
  
end
