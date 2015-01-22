class MedicationsController < ApplicationController

  def index
    @medications = Medication.all
  end

  def show
    @medication = Medication.find params[:id]
  end


  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.create medication_params
    redirect_to medications_path
  end

  def edit
    @medication = Medication.find params[:id]
  end

  def update
    @medication = Medication.find params[:id]
    @medication.update medication_params
    redirect_to medications_path
  end

  def destroy
    @medication = Medication.find params[:id]
    @medication.delete
    redirect_to medications_path
  end

private
  def medication_params
    params.require(:medication).permit(
      :name,
      :company,
      :adverse_reactions,
      :generic_option
      )
  end





end
