# ds_projects
My personal projects in Data Science

## ds_projects/hf_mlp_flask_docker/
The neural network model to predict the heat of formation of a compound based on its chemical formula.
The accuracy (MAE) is about 43 meV/atom, reaching the so-called [Chemical Accuracy](https://chemistry.stackexchange.com/questions/62001/why-is-chemical-accuracy-defined-as-1-kcal-mol#:~:text=Chemical%20accuracy%20is%20the%20accuracy,mol%20or%204%20kJ%2Fmol), 
and hence allowing for realistic applications without complicated atomic simulations.

A simple Web API with Flask and a Dockerfile are included for deployment on AWS, etc.
You can use the model via the webpage, as well as cURL if the command line way is preferred.

$ python app.py  
$ curl -X POST 0.0.0.0:5000/curl -H 'Content-Type: application/json' -d '"Sn1O1 Sn1O2 Sn2O3 Zn1O1 Zn1Sn1O2"'  
Sn1O1                                     -1.570 ev/atom  
Sn1O2                                     -1.859 ev/atom  
Sn2O3                                     -1.483 ev/atom  
Zn1O1                                     -1.606 ev/atom  
Zn1Sn1O2                                  -1.450 ev/atom  

To test the docker, first build and run the image:
$ docker build -t app-hf  .
$ docker run -p 5000:5000 app-hf
and then use the curl command line:
$ curl -X POST 0.0.0.0:5000/curl -H 'Content-Type: application/json' -d '"Sn1O1 Sn1O2 Sn2O3 Zn1O1 Zn1Sn1O2"'

## More is coming soon

