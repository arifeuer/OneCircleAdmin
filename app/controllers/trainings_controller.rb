class TrainingsController < ApplicationController
  #before_action :set_Train, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_current_user

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Trainings.all
  end
  

  # GET /trainings/1
  # GET /trainings/1.json
  
  # def show
  # end
  
end
  



