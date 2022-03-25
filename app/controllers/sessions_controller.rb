class SessionsController < ApplicationController

  def index
    session[:page_views] ||= 0    
    session[:page_views] += 1
    
    if session[:page_views] <= 3
      article = Article.find(params[:id])
      render json: article
    else 
      render json: { error: "Limit reached"}, status: :unauthorized
    end 
  end 

end