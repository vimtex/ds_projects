FROM python:3.8-slim
MAINTAINER Haowei Peng "haoweipeng@gmail.com"

COPY . /deploy/
WORKDIR /deploy/
RUN ls -R

RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["python", "app_heatf.py"]
