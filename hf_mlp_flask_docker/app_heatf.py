# USAGE
# Start the server:
# 	python app.py
# Submit a request via curl:
#   curl -X POST 0.0.0.0:5000/predict -H 'Content-Type: application/json' -d "\"Sn1O2\""
#   curl -X POST 0.0.0.0:5000/predict -H 'Content-Type: application/json' -d "\"Sn1O2 Sn2O3\""
#   curl -X POST 0.0.0.0:5000/predict -H 'Content-Type: application/json' -d "\"Sn1O1 Sn1O2 Sn2O3 Zn1O1 Zn1Sn1O2 Zn1Sn1O3 Zn2Sn1O3 Zn3Sn1O4\""

from heatf import Model
from flask import Flask, jsonify, request, render_template

model = Model()

#HEADERS = {'Content-type': 'application/json', 'Accept': 'text/plain'}

def flask_app():
  app = Flask(__name__)
  
  @app.route('/', methods=['GET', 'POST'])
  @app.route('/main', methods=['GET', 'POST'])
  def main():

    if request.method == 'GET':
      return render_template('main.html', 
                              title='Deep Learning for Heat of Formation')
    

    if request.method == 'POST':
      data = request.form["Compounds"]
      pred = model.predict( data )
      return render_template('main.html', 
                              title='Deep Learning for Heat of Formation: Have Fun!',
                              result=pred)
  
  @app.route('/curl', methods=['POST'])
  def curl():
    if request.method == 'POST':
      pred = model.predict( request.get_json()  )
      res = "\n".join(["{:<40}  {:.3f} ev/atom".format(x,y)  for x,y in pred])
      return res+'\n'

  return app


if __name__ == "__main__":
  app = flask_app()
  #app.run(host='0.0.0.0', port=5000,  debug=True)
  app.run(host='0.0.0.0', port=5000)
