import matplotlib.pyplot as plt
import numpy as np
from pdf import PdfConverter
import textract

import glob
import nltk
#nltk.download('punkt')
#nltk.download('stopwords')

from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from nltk.tokenize import RegexpTokenizer

punctuations = ['(',')',';',':','[',']',',']
stop_words = set(stopwords.words('english'))
stop_words.update({'et', 'al'})
tokenizer = RegexpTokenizer(r'\w+')
#words = [ps.stem(w) for w in words]

excludes = "acknowledge"
excludes = excludes.split()

data = ''
for path in sorted(glob.glob('my_pub/*.pdf')):
  try:
    pdf = PdfConverter(file_path=path)
    data_= pdf.extractTxt()
  except:
    data_= textract.process(path, method='pdfminer').decode()

  d = data_.lower()
  idx = len(d)
  for ex in excludes:
    try:
       idx = min(d.index(ex), idx)
    except:
      pass
  words = tokenizer.tokenize(data_[:idx])
  words = [w for w in words if not w in stop_words ]
  data += " ".join(words)

