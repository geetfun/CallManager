class TokensController < ApplicationController
  
  respond_to :json
  
  def create
    @token = Token.new(params[:token])
    @token.outgoing = true
    if @token.save
      flash[:notice] = "Token generated"
    end
    respond_with(@token, only: [:value, :expiration, :incoming, :incoming_name, :outgoing])
  end
  
end
