class GuardingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: [:show, :edit, :update]

  def show
    @user = current_user
    @guarding.users.each do |users|
      if users != @user
        flash[:alert] = "Vous n'êtes pas autorisé à voir ce gardiennage"
        redirect_to root_path
      end
    end
  end

  def edit
    @user = current_user
    if @user.within_one_km_of_guarding?(@guarding)
      if @guarding.presence
        flash[:alert] = "Vous ne pouvez pas modifier un gardiennage en cours"
        redirect_to guarding_path(@guarding)
      end
    else
      flash[:alert] = "Vous devez être à moins de 1km du gardiennage pour pouvoir le signer"
      redirect_to guarding_path(@guarding)
    end
  end

  def update
    @guarding.update(guarding_params)
    redirect_to guarding_path(@guarding), notice: "Votre gardiennage a bien été signé"
  end

  private

  def set_params
    @guarding = Guarding.find(params[:id])
  end

  def guarding_params
    params.require(:guarding).permit(:presence)
  end
end
