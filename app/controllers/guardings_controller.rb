class GuardingsController < ApplicationController
  def show
    @user = current_user # Assuming you have a current_user method
    @guarding = Guarding.find(params[:id]) # Assuming you have the restaurant's ID

    if @user.within_one_km_of_guarding?(@guarding)
      @message = "You are within 1 km of the restaurant."
    else
      @message = "You are not within 1 km of the restaurant."
    end
  end
end
