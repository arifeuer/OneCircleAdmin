require 'chronic'
class TrainingsController < ApplicationController
  #before_action :set_Train, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_current_user

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all
  end
  

  # GET /trainings/1
  # GET /trainings/1.json
  
  # def show
  # end
  
end
  



#   private
#     # Use callbacks to share common setup or constraints between actions.
#     #def set_Train
#     #  @Train = Train.find(params[:id])
#     #end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def Train_params
#       params.require(:Train).permit(:start_time, :end_time, :Train_id)
#     end
    
#     #Keys: Train, user, start_time, end_time, description
#     def json_trainings(instances)
#       lst = []
#       instances.each do |Train|
#         lst << Train.full_json
#       end
#       lst
#     end 
# end