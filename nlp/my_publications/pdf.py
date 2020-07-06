from pdfminer.pdfinterp import PDFResourceManager, PDFPageInterpreter
from pdfminer.converter import TextConverter
from pdfminer.layout import LAParams
from pdfminer.pdfpage import PDFPage
from io import StringIO

class PdfConverter:

   def __init__(self, file_path):
       self.file_path = file_path

# convert pdf file to a string which has space among words 
   def extractTxt(self):
       rsrcmgr = PDFResourceManager()
       retstr = StringIO()
       codec = 'utf8'  # 'utf16','utf-8'
       laparams = LAParams()
       device = TextConverter(rsrcmgr, retstr, laparams=laparams)
       fp = open(self.file_path, 'rb')
       interpreter = PDFPageInterpreter(rsrcmgr, device)
       password = ""
       maxpages = 0
       caching = True
       pagenos = set()
       for page in PDFPage.get_pages(fp, pagenos, maxpages=maxpages, password=password, caching=caching, check_extractable=True):
           interpreter.process_page(page)
       fp.close()
       device.close()
       str = retstr.getvalue()
       retstr.close()
       return str

# convert pdf file text to string and save as a text_pdf.txt file
   def saverTxt(self):
       content = self.extractTxt()
       txt_pdf = open('text_pdf.txt', 'wb')
       txt_pdf.write(content.encode('utf-8'))
       txt_pdf.close()

if __name__ == '__main__':
    pdfConverter = PdfConverter(file_path='1206.5533.pdf')
    print(pdfConverter.extractTxt())
