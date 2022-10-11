FROM ubuntu

FROM python

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /App/requirements.txt

WORKDIR /App

RUN pip install -r requirements.txt

COPY . /App

CMD python /App/model.py && python /App/server.py

 
