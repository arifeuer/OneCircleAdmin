class Form < ActiveRecord::Base
    attr_accessor :stc_field_representative, :certification_number, :start_date, :end_date, :location, :certified_date, :course_title, :total_participants 
    
    #def generate_stc(template_filenamte)
    #    `python lib/STC_generate.py template_filenamte #{:stc_field_representative}, #{:certification_number}, #{:start_date}, #{:end_date}, #{:location}, #{:certified_date}, #{:course_title}, #{:total_participants} 'STC Sign In Sheet'`
    #end
    
    def generate_stc(template_filename)
        doc = DocxReplace::Doc.new(template_filename, "#{Rails.root}/tmp")
        
        fields = {"FIELD_REP": stc_field_representative, 
			"CERT_NUMBER": certification_number,
			"START_DATE": start_date, 
			"END_DATE": end_date, 
			"LOCATION_TO_EDIT": location, 
			"CERTIFIED_DATE": certified_date, 
			"TITLE_COURSE": course_title, 
			"TOTAL_PART": total_participants}
			
		#doc.tables.each do |table|
		#    table.columns.each do |column|
		#        column.cells.each do |cell|
		fields.each do |key, val|
		  doc.replace(key.to_s, val)
		end
		
		tmp_file = Tempfile.new('word_tempate', "#{Rails.root}/tmp")
      	doc.commit(tmp_file.path)
		send_file tmp_file.path, filename: "STC Sign In Sheet.docx", disposition: 'attachment'
    end
end
