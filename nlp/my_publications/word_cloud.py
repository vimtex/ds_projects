from wordcloud import WordCloud, ImageColorGenerator
import matplotlib.pyplot as plt
from PIL import Image
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
  words = [w for w in words if ((not w in stop_words) and len(w)>2) ]
  data += " ".join(words)

#ourMask = np.array(Image.open('twitter_mask.png'))

#  #cloud = WordCloud(width=800, height=400, background_color='white').generate(data)
#  cloud = WordCloud(width=1600, height=800, background_color='white').generate(data)
#  
#  #plt.figure( figsize=(10,5), facecolor='k' )
#  plt.figure( figsize=(10,5), facecolor='white' )
#  plt.imshow(cloud, interpolation='bilinear')
#  plt.axis('off')
#  #plt.savefig('wordcloud.png', facecolor='k', bbox_inches='tight')
#  plt.tight_layout(pad=0)
#  plt.show()

###
#mask = np.array(Image.open('head-01.jpg'))
mask = np.array(Image.open('head.png'))
mask = np.concatenate((mask[:,:,1:], mask[:,:,1:], mask[:,:,1:]), axis=2)
image_colors = ImageColorGenerator(mask)

wordcloud = WordCloud(width=1200, height=1200, background_color="white", 
                      max_font_size=40, max_words=10000,
                      mask=mask, color_func=image_colors,
                      contour_width=4, contour_color='steelblue').generate(data) # generate_from_frequencies(data)

plt.figure( figsize=(8,8) )
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.tight_layout(pad=0)
plt.show()
