class MedicationsController < ApplicationController

  def index
    @medications = Medication.all
  end

  def show
    @clinic = Clinic.find params[:clinic_id]
    @patient = Patient.find params[:patient_id]
    @medication = Medication.find params[:id]
  end


  def new
    @clinic = Clinic.find params[:clinic_id]
    @patient = @clinic.patients.find params[:patient_id]
    @medication = @patient.medications.new
  end

  def create
    @clinic = Clinic.find params[:clinic_id]
    @patient = @clinic.patients.find params[:patient_id]
    @medication = @patient.medications.create medication_params
    redirect_to clinic_patient_path(@clinic, @patient)
  end

  def edit
    @clinic = Clinic.find params[:clinic_id]
    @patient = @clinic.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
  end

  def update
    @clinic = Clinic.find params[:clinic_id]
    @patient = @clinic.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
    @medication.update medication_params
    redirect_to clinic_patient_path(@clinic, @patient)
  end

  def destroy
    @medication = Medication.find params[:id]
    @clinic = Clinic.find params[:clinic_id]
    @patient = Patient.find params[:patient_id]
    @medication.delete
    redirect_to clinic_patient_path(@clinic, @patient)
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

  def set_patient
    @patient = Patient.find params[:id]
  end

end
