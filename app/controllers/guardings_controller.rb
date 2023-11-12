class GuardingsController < ApplicationController
  def show
    @user = current_user
    @guarding = Guarding.find(params[:id])
  end

  def edit
    @guarding = Guarding.find(params[:id])
    @user = current_user
    if @user.within_one_km_of_guarding?(@guarding)
      if @guarding.presence
        flash[:alert] = "Vous ne pouvez pas modifier un gardiennage en cours"
        redirect_to guarding_path(@guarding)
      else
        @guarding = Guarding.find(params[:id])
      end
    else
      flash[:alert] = "Vous devez être à moins de 1km du gardiennage pour pouvoir le modifier"
      redirect_to guarding_path(@guarding)
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
