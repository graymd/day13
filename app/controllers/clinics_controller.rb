class ClinicsController < ApplicationController
  def index
    @clinics = Clinic.all
  end

  def show
    set_clinic
    @patients = @clinic.patients
  end
  
  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.create my_params
    redirect_to clinics_path
  end

  def edit
    @clinic = Clinic.find params[:id]
  end

  def update
    @clinic = Clinic.find params[:id]
    @clinic.update my_params
    redirect_to clinics_path
  end

  def destroy
    @clinic = Clinic.find params[:id]
    @clinic.delete
    redirect_to clinics_path
  end

private
  def my_params
    params.require(:clinic).permit(
      :name,
      :st_address,
      :city,
      :state
    )
  end

  def set_clinic
    @clinic = Clinic.find params[:id]
  end


end
