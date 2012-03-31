class TokensController < ApplicationController
  
  respond_to :json
  
  def create
    @token = Token.new(params[:token])
    if @tocken.save
      flash[:notice] = "Token generated"
    end
    respond_with(@token)
  end
  
end
