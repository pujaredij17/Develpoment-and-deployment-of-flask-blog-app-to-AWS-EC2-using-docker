FROM ubuntu:16.04


RUN apt-get update -y && \
    apt-get install -y python-pip python-dev    

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt
RUN pip install flask-mail
RUN pip install pillow

COPY run.py /usr/src/app/
COPY flaskblog1/static/main.css /usr/src/app/flaskblog1/static/
COPY flaskblog1/templates/* /usr/src/app/flaskblog1/templates/
COPY flaskblog1/errors/* /usr/src/app/flaskblog1/errors/
COPY flaskblog1/main/* /usr/src/app/flaskblog1/main/ 
COPY flaskblog1/posts/* /usr/src/app/flaskblog1/posts/ 
COPY flaskblog1/users/* /usr/src/app/flaskblog1/users/
COPY flaskblog1/*.py /usr/src/app/flaskblog1/
COPY flaskblog1/static/profile_pics/* /usr/src/app/flaskblog1/static/profile_pics/

 
WORKDIR /usr/src/app/

EXPOSE 5000

CMD ["python", "/usr/src/app/run.py"] 