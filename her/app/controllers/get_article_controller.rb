class GetArticleController < ApplicationController
  def show
    pp "****************************"
    pp params
    id=params.permit(:id,:title,:text)
    pp params
    #pp Art.all.fetch
    pp Art.find(1)
    render json: {test:"OK"} #Art.find(params[:id])
  end


end
