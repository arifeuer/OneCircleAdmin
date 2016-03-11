from docx import *
import sys


# REQUIRES IN ARGUEMTNS THE FOLLOWING ORDER (excluding the name of this pythons cript:
# Field Rep
# Certification Number
# Start Date
# End Date
# Location
# Hours Certified
# Date Certified
# Course Title


document = Document('STC Sign in Sheet - GILRS.docx')

if len(sys.argv) < 9:
	print "not enough arguments"
	sys.exit()

field_rep = sys.argv[1]
cert_number = sys.argv[2]
start_date = sys.argv[3]
end_date = sys.argv[4]
location_to_edit = sys.argv[5]
certified_date = sys.argv[6]
title_course = sys.argv[7]
total_part = sys.argv[8]

for p in document.tables:
	for c in p.columns:
		for n in c.cells:

			if "FIELD_REP" in n.text:
				for a in n.paragraphs:
					if "FIELD_REP" in a.text:
						a.text = a.text.replace("FIELD_REP", field_rep)

			if "CERT_NUMBER" in n.text:
				for a in n.paragraphs:
					if "CERT_NUMBER" in a.text:
						a.text = a.text.replace("CERT_NUMBER", cert_number)

			if "START_DATE" in n.text:
				for a in n.paragraphs:
					if "START_DATE" in a.text:
						a.text = a.text.replace("START_DATE", start_date)

			if "END_DATE" in n.text:
				for a in n.paragraphs:
					if "END_DATE" in a.text:
						a.text = a.text.replace("END_DATE", end_date)

			if "LOCATION_TO_EDIT" in n.text:
				for a in n.paragraphs:
					if "LOCATION_TO_EDIT" in a.text:
						a.text = a.text.replace("LOCATION_TO_EDIT", location_to_edit)


			if "CERTIFIED_DATE" in n.text:
				for a in n.paragraphs:
					if "CERTIFIED_DATE" in a.text:
						a.text = a.text.replace("CERTIFIED_DATE", certified_date)

			if "TITLE_COURSE" in n.text:
				for a in n.paragraphs:
					if "TITLE_COURSE" in a.text:
						a.text = a.text.replace("TITLE_COURSE", title_course)

			if "TOTAL_PART" in n.text:
				for a in n.paragraphs:
					if "TOTAL_PART" in a.text:
						a.text = a.text.replace("TOTAL_PART", total_part)

document.save('test.doc')