class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]
    
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    #default new view
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.create!(form_params)
 
    form_replace
    
    flash[:notice] = "#{@form.type} was successfully created."
    redirect_to forms_path
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def form_replace
    debugger
    respond_to do |format|
      format.docx do
        # Initialize DocxReplace with your template
        doc = DocxReplace::Doc.new("#{Rails.root}/lib/form_templates/STC_Sign_In_Template.docx.docx", "#{Rails.root}/tmp")
  
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
        send_file tmp_file.path, filename: "STC_Sign_In_Sheet.docx", disposition: 'attachment'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:stc_field_representative, :certification_number, :start_date, :end_date, :location, :certified_date, :course_title, :total_participants)
    end
end
