class HomeController < ApplicationController
  def index
    render json: {
      messages: 'Welcome!'
    }
  end
end
