class GuardingsController < ApplicationController
  def show
    @user = current_user # Assuming you have a current_user method
    @guarding = Guarding.find(params[:id]) # Assuming you have the restaurant's ID
  end

  def edit
    @guarding = Guarding.find(params[:id])
    if @guarding.presence
      flash[:alert] = "Vous ne pouvez pas modifier un gardiennage en cours"
      redirect_to guarding_path(@guarding)
    else
      @guarding = Guarding.find(params[:id])
    end
  end

  def update
    @guarding = Guarding.find(params[:id])
    @guarding.update(guarding_params)
    redirect_to guarding_path(@guarding), notice: "Guarding updated"
  end

  private

  def guarding_params
    params.require(:guarding).permit(:presence)
  end
end
