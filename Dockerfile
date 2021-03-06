FROM python:3.4

echo "curl"
RUN curl -sL https://deb.nodesource.com/setup | bash -

echo "apt-get"
RUN apt-get --no-install-recommends install -y install nodejs


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN pip install -r requirements.txt

RUN npm install -g gulp
RUN npm install 

RUN python manage.py runserver 0.0.0.0:8000
RUN gulp dev

EXPOSE 8000
