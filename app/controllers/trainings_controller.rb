require 'chronic'
class TrainingsController < ApplicationController
  #before_action :set_Train, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_current_user

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Trainings.all
  end
  
  def new
    @type = params[:type]
    @sheet = params[:sheet]
    @id = params[:id]
    @training = Trainings.find(@id)
    #default new view
  end
  
  def generate_forms
    @type = params[:type]
    @id = params[:id]
    @training = Trainings.find(@id)
    if @type == "STC"
      @partial_type = "stc_partial"
    elsif @type == "NASW"
      @partial_type = "nasw_partial"
    elsif @type == "CE"
      @partial_type = "ce_partial"
    else
      @partial_type = "stc_partial"
    end
    # @type = "STC"
  end
  
   def create
    @form = Form.create!(form_params)

 
    form_replace
    
    #flash[:notice] = "#{@form.type} was successfully created."
    #redirect_to forms_path
  end
  
  def form_replace
    #Using docx_replace gem
    #https://github.com/adamalbrecht/docx_replace
    
    doc = DocxReplace::Doc.new("#{Rails.root}/lib/form_templates/STC_Sign_In_Template_Public.docx", "#{Rails.root}/tmp")

    # Replace some variables. $var$ convention is used here, but not required.
    doc.replace("FIELD_REP", @form.stc_field_representative)
    doc.replace("CERT_NUMBER", @form.certification_number)
    doc.replace("START_DATE", @form.start_date)
    doc.replace("END_DATE", @form.end_date)
    doc.replace("LOCATION_TO_EDIT", @form.location)
    doc.replace("CERTIFIED_DATE", @form.certified_date)
    doc.replace("TITLE_COURSE", @form.course_title)
    doc.replace("TOTAL_PART", @form.total_participants)

    # Write the document back to a temporary file
    tmp_file = Tempfile.new('word_template', "#{Rails.root}/tmp")
    doc.commit(tmp_file.path)

    # Respond to the request by sending the temp file

    #flash[:notice] = "File Downloaded"
    
    #redirect_to new_form_path
    send_file tmp_file.path, filename: "STC_Sign_In_Sheet.docx", disposition: 'attachment'
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