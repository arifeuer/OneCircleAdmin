from docx import *


if __name__ == "__main__":
	document = Document('STC Sign in Sheet - GILRS.docx')
	# document = open('STC Sign in Sheet - GILRS.docx')
	
	for p in document.tables:
		i = 0
		j = 0
		for c in p.columns:
			for n in c.cells:
				# print "("+str(i)+","+str(j)+") : " + n.text
				if "START_DATE" in n.text:
					for a in n.paragraphs:
						if "START_DATE" in a.text:
							a.text = a.text.replace("START_DATE", "11-11-11")
						# print a
					# print n.text
					# print n.text.replace("START_DATE", "11-11-11")
					# n.text = n.text.replace("START_DATE", "11-11-11")
				j += 1
			i += 1
			j = 0
	
		# if 'START_DATE' in paragraph.text:
		# 	paragraph.text = '11-11-11'
	
	document.save('test.doc')