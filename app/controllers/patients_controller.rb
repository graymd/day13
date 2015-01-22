class PatientsController < ApplicationController
  def show
    @patient = Patient.find params[:id]
  end


  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create patient_params
      if @patient.save
      flash[:notice] = 'Patient info was successfully saved.'
      redirect_to patients_path
    else
      flash[:error] = 'Patient info was NOT successfully saved.'
      render :new
    end
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    if @patient.update_attributes patient_params
      flash[:notice] = 'Patient info was successfully updated.'
      redirect_to patients_path
    else
      flash[:notice] = 'Patient info was NOT successfully updated.'
      render :edit
    end

  end

  def destroy
    @patient = Patient.find params[:id]
    if @patient.delete
      flash[:notice] = 'Patient info was successfully deleted.'
      redirect_to patients_path
    else
      flash[:notice] = 'Patient info was NOT successfully deleted.'
    end
  end




















private
  def patient_params
    params.require(:patient).permit(
        :first_name,
        :last_name,
        :date_of_birth,
        :description,
        :gender,
        :blood_type
      ) 
  end

end
